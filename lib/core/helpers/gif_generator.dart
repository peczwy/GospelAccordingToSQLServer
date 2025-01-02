import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'dart:ui' as ui show Image;

class GifGenerator {
  GifGenerator._();

  static final GifGenerator instance = GifGenerator._();

  final random = Random();

  // late Future<ImageProvider?> current = _next(asset: 'images/landing.gif', frames: 24);

  // Iterable<img.Image> _cut(List<img.Image> images, int target, int cutLength) {
  //   final output = <img.Image>[];
  //   final span = random.nextInt(min(max(1, target), cutLength)) + 1;
  //   final offset = random.nextInt(max(1, images.length - span));
  //   for (var i = offset; i < min(offset + span, images.length); ++i) {
  //     output.add(images[i]);
  //   }
  //   return output;
  // }
  //
  // Future<ImageProvider?> _next({
  //   required String asset,
  //   int frames = 24,
  // }) async {
  //   print('NEXT: ${DateTime.now()}');
  //   var image = await prepare(asset: asset);
  //   if (image == null) {
  //     return null;
  //   }
  //   print('NEXT-2: ${DateTime.now()}');
  //   final framez = image.frames;
  //   final sample = framez.first;
  //   final output = img.Image(width: sample.width, height: sample.height);
  //   var count = 0;
  //   while (output.frames.length < frames && count < 5) {
  //     count++;
  //     for (final frame in _cut(framez, frames - output.frames.length, 12)) {
  //       output.addFrame(img.grayscale(frame));
  //     }
  //   }
  //   print('NEXT-3: ${DateTime.now()}');
  //
  //   // final result = await compute((message) {
  //   //   print('NEXT-OUT: ${DateTime.now()}');
  //   //   final bytes = img.encodeGif(output);
  //   //   print('NEXT-OUT-2: ${DateTime.now()}');
  //   //   final result = MemoryImage(bytes);
  //   //   print('NEXT-OUT-3: ${DateTime.now()}');
  //   //   return result;
  //   // }, '');
  //   // return result;
  //   return null;
  // }

  Future<List<ui.Image>> _extract(ByteData data) async {
    final frames = <ui.Image>[];

    final ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());

    final int frameCount = codec.frameCount;
    for (int i = 0; i < frameCount; i++) {
      final ui.FrameInfo fi = await codec.getNextFrame();
      frames.add(fi.image);
    }
    return frames;
  }

  Future<List<ui.Image>> loadGif() async {
    print('LOAD: ${DateTime.now()}');
    final ByteData data = await rootBundle.load('images/landing.gif');

    final frames = await _extract(data);
    print('DONE: ${DateTime.now()}: ${frames.length}');
    return frames;
  }

  // Future<img.Image?> prepare({required String asset}) async {
  //   var image = _memory[asset];
  //   if (image == null) {
  //     image = _prepare(asset: asset);
  //     _memory[asset] = image;
  //   }
  //   return image;
  // }
  //
  // Future<void> next({
  //   required String asset,
  //   int frames = 24,
  // }) async {
  //   final future = _next(asset: asset, frames: frames);
  //   await future;
  //   current = future;
  // }
  //
  // Future<void> landing() => next(asset: 'images/landing.gif', frames: 24);
  //
  // Future<void> prepareLanding() => prepare(asset: 'images/landing.gif');
}
