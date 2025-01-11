import 'dart:async';
import 'dart:ui' as ui show Image;
import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class Gif extends StatelessWidget {
  const Gif({
    super.key,
    required this.images,
    this.width,
    this.height,
    this.callback,
    this.fit,
    this.fps = 30,
    this.filter = const ColorFilter.mode(Colors.transparent, BlendMode.srcIn),
  });

  final List<ui.Image> images;

  final int fps;

  final Function()? callback;

  final double? width;

  final double? height;

  final BoxFit? fit;

  final ColorFilter filter;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GifCubit>(
      create: (_) => GifCubit(
        length: images.length,
        callback: callback,
        fps: fps,
      ),
      child: BlocBuilder<GifCubit, int>(
        builder: (context, state) {
          unawaited(context.read<GifCubit>().requestFrame());
          return ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.saturation,
            ),
            child: RawImage(
              image: images[state],
              width: width,
              height: height,
              fit: fit,
            ),
          );
        },
      ),
    );
  }
}

class GifCubit extends Cubit<int> {
  GifCubit({
    required this.length,
    this.fps = 30,
    this.loop = false,
    this.callback,
  }) : super(0);

  final int fps;

  late final int sleep = 1000 ~/ fps;

  late final Duration duration = Duration(milliseconds: sleep);

  final Function()? callback;
  final int length;

  final bool loop;

  Future<void> requestFrame() async {
    await Future.delayed(duration);
    final next = state + 1;
    if (!loop && next == length) {
      final callback = this.callback;
      if (callback != null) {
        callback();
      }
      return;
    }
    emit(next % length);
  }
}
