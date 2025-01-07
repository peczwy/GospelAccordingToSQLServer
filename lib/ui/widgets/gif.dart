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
    this.passpartout = false,
    this.callback,
    this.fit,
  });

  final List<ui.Image> images;

  final Function()? callback;

  final double? width;

  final double? height;

  final bool passpartout;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: passpartout ? Colors.black : Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(passpartout ? 100 : 0),
        child: BlocProvider<GifCubit>(
          create: (_) => GifCubit(
            length: images.length,
            callback: callback,
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
        ),
      ),
    );
  }
}

class GifCubit extends Cubit<int> {
  GifCubit({
    required this.length,
    this.loop = false,
    this.callback,
  }) : super(0);

  final Function()? callback;
  final int length;

  final bool loop;

  Future<void> requestFrame() async {
    await Future.delayed(const Duration(milliseconds: 86));
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
