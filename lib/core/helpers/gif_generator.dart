import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class GifGenerator {
  GifGenerator._();

  static final GifGenerator instance = GifGenerator._();

  final random = Random();

  final Map<String, Future<List<ui.Image>>> cache = {};

  Future<List<ui.Image>> _prepare({required String asset}) async {
    try {
      final bytes = await rootBundle.load(asset);
      final frames = <ui.Image>[];

      final codec = await ui.instantiateImageCodec(bytes.buffer.asUint8List());

      final frameCount = codec.frameCount;
      for (int i = 0; i < frameCount; i++) {
        final frame = await codec.getNextFrame();
        frames.add(frame.image);
      }
      return frames;
    } catch (e, _) {
      return [];
    }
  }

  Future<void> preload({required int count}) async {
    for (var i = 0; i < count; ++i) {
      await prepare(order: i);
    }
  }

  Future<List<ui.Image>> prepare({int order = 1}) async {
    final asset = 'assets/images/gifs/$order.gif';
    var result = cache[asset];
    if (result == null) {
      result = _prepare(asset: asset);
      cache[asset] = result;
    }
    return result;
  }

  Future<List<ui.Image>> next({int order = 1, int length = 16}) async {
    final template = await prepare(order: order);
    final IGifGenerator strategy = switch (random.nextInt(3)) {
      0 => JaggedGifGenerator(length: length),
      1 => CutGifGenerator(length: length, cutLength: random.nextInt(6) + 14, rerollTemplate: false),
      _ => CutGifGenerator(length: length, cutLength: random.nextInt(6) + 14),
    };
    return await strategy.generate(this);
  }
}

abstract interface class IGifGenerator {
  Future<List<ui.Image>> generate(GifGenerator registrar);
}

class JaggedGifGenerator implements IGifGenerator {
  JaggedGifGenerator({required this.length});

  final int length;
  final random = Random();
  @override
  Future<List<ui.Image>> generate(GifGenerator registrar) async {
    final frames = <ui.Image>[];
    final keysCount = registrar.cache.length;
    for (var i = 0; i < length; ++i) {
      final template = await registrar.prepare(order: random.nextInt(keysCount));
      if (template.isEmpty) {
        /// This means we have some inconsistency in gifs folder i.e. missing ID
        return frames;
      }
      frames.add(template[random.nextInt(template.length)]);
    }
    return frames;
  }
}

class CutGifGenerator implements IGifGenerator {
  CutGifGenerator({
    required this.length,
    this.maxCount = 20,
    this.cutLength = 20,
    this.rerollTemplate = true,
  });

  final int length;

  final int maxCount;

  final int cutLength;

  final bool rerollTemplate;

  final random = Random();

  Iterable<ui.Image> _cut(List<ui.Image> template, int target, int cutLength) {
    final output = <ui.Image>[];
    final span = random.nextInt(min(max(1, target), cutLength)) + 1;
    final offset = random.nextInt(max(1, template.length - span));
    for (var i = offset; i < min(offset + span, template.length); ++i) {
      output.add(template[i]);
    }
    return output;
  }

  @override
  Future<List<ui.Image>> generate(GifGenerator registrar) async {
    final frames = <ui.Image>[];
    var count = 0;
    final keysCount = registrar.cache.length;
    var template = await registrar.prepare(order: random.nextInt(keysCount));
    var cut = _cut(template, length - frames.length, cutLength);
    if (template.isEmpty || cut.isEmpty) {
      /// This means we have some inconsistency in gifs folder i.e. missing ID
      return frames;
    }
    while (frames.length < length && count < maxCount) {
      count++;
      frames.addAll(cut);
      if (rerollTemplate) {
        template = await registrar.prepare(order: random.nextInt(keysCount));

        cut = _cut(template, length - frames.length, cutLength);
        if (template.isEmpty || cut.isEmpty) {
          /// This means we have some inconsistency in gifs folder i.e. missing ID
          return frames;
        }
      }
    }
    return frames;
  }
}
