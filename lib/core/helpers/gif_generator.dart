import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'dart:ui' as ui show Image;

import 'package:gospel_at_flutter/_exports.dart';

class GifGenerator {
  GifGenerator._();

  static final GifGenerator instance = GifGenerator._();

  final random = Random();

  final Map<String, Future<List<ui.Image>>> _cache = {};

  Future<List<ui.Image>> _prepare({required String asset}) async {
    final bytes = await rootBundle.load(asset);
    final frames = <ui.Image>[];

    final codec = await ui.instantiateImageCodec(bytes.buffer.asUint8List());

    final frameCount = codec.frameCount;
    for (int i = 0; i < frameCount; i++) {
      final frame = await codec.getNextFrame();
      frames.add(frame.image);
    }
    return frames;
  }

  Future<List<ui.Image>> prepare({String asset = 'images/landing.gif'}) async {
    var result = _cache[asset];
    if (result == null) {
      result = _prepare(asset: asset);
      _cache[asset] = result;
    }
    return result;
  }

  Future<List<ui.Image>> next({String asset = 'images/landing.gif', int length = 24}) async {
    final template = await prepare(asset: asset);
    final IGifGenerator strategy = switch (random.nextInt(10)) {
      0 => JaggedGifGenerator(length: length),
      1 => RepeaterGifGenerator(length: length, repeats: 5),
      _ => CutGifGenerator(length: length, cutLength: random.nextInt(6) + 14),
    };
    return await strategy.generate(template);
  }
}

abstract interface class IGifGenerator {
  Future<List<ui.Image>> generate(List<ui.Image> template);
}

class JaggedGifGenerator implements IGifGenerator {
  JaggedGifGenerator({required this.length});

  final int length;
  final random = Random();
  @override
  Future<List<ui.Image>> generate(List<ui.Image> template) async {
    final frames = <ui.Image>[];
    for (var i = 0; i < length; ++i) {
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
  });

  final int length;

  final int maxCount;

  final int cutLength;

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
  Future<List<ui.Image>> generate(List<ui.Image> template) async {
    final frames = <ui.Image>[];
    var count = 0;
    while (frames.length < length && count < maxCount) {
      count++;
      frames.addAll(_cut(template, length - frames.length, cutLength));
    }
    return frames;
  }
}

class RepeaterGifGenerator implements IGifGenerator {
  RepeaterGifGenerator({
    required this.length,
    this.repeats = 20,
  });

  final int length;

  final int repeats;

  final random = Random();

  @override
  Future<List<ui.Image>> generate(List<ui.Image> template) async {
    final cutLength = (length / repeats).round() + 1;
    final generator = CutGifGenerator(length: cutLength, cutLength: cutLength, maxCount: cutLength);
    final toRepeat = await generator.generate(template);
    final frames = <ui.Image>[];
    while (frames.length < length) {
      frames.addAll(toRepeat);
    }
    return frames;
  }
}
