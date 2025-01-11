import 'dart:async';
import 'dart:math';

import 'dart:ui' as ui show Image;
import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';
import 'package:gospel_at_flutter/ui/widgets/text_overlay.dart';

class OverlaidGif extends StatelessWidget {
  const OverlaidGif({
    super.key,
    required this.images,
    this.width,
    this.height,
    this.passpartout = false,
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

  final bool passpartout;

  final BoxFit? fit;

  final ColorFilter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: passpartout ? Colors.black : Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(passpartout ? 100 : 0),
        child: BlocProvider<OverlaidGifCubit>(
          create: (_) => OverlaidGifCubit(
            length: images.length,
            callback: callback,
            fps: fps,
          ),
          child: BlocBuilder<OverlaidGifCubit, int>(
            builder: (context, state) {
              unawaited(context.read<OverlaidGifCubit>().requestFrame());
              return TextOverlay(
                text: state < 10 ? 'LONG' : 'LOVE',
                height: height,
                width: width,
                child: ColorFiltered(
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class OverlaidGifCubit extends Cubit<int> {
  OverlaidGifCubit({
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
