import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

class GifGenerator {
  GifGenerator._();

  static final GifGenerator instance = GifGenerator._();

  final _memory = <String, img.Image>{};

  final random = Random();

  Iterable<img.Image> _cut(List<img.Image> images, int target, int cutLength) {
    final output = <img.Image>[];
    final span = random.nextInt(min(max(0, target), cutLength)) + 1;
    final offset = random.nextInt(max(0, images.length - span));
    for (var i = offset; i < min(offset + span, images.length); ++i) {
      output.add(images[i]);
    }
    return output;
  }

  Future<ImageProvider?> shuffle({
    required String asset,
    int frames = 24,
  }) async {
    var image = _memory[asset];
    if (image == null) {
      final data = await rootBundle.load(asset);
      image = img.decodeGif(data.buffer.asUint8List());
      if (image == null) {
        return null;
      }
      _memory[asset] = image;
    }
    final framez = image.frames;
    final sample = framez.first;
    final output = img.Image(width: sample.width, height: sample.height);
    while (output.frames.length < frames) {
      print(output.frames.length);
      for (final frame in _cut(framez, frames - output.frames.length, 12)) {
        output.addFrame(img.grayscale(frame));
      }
    }
    return MemoryImage(img.encodeGif(output));
  }
}
