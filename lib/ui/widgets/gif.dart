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
    this.listener,
  });

  final List<ui.Image> images;

  final AnimationStatusListener? listener;

  final double? width;

  final double? height;

  final bool passpartout;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: passpartout ? Colors.black : Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(passpartout ? 100 : 0),
        child: BlocProvider<GifCubit>(
          create: (_) => GifCubit(length: images.length),
          child: BlocBuilder<GifCubit, int>(
            builder: (context, state) {
              unawaited(context.read<GifCubit>().requestFrame());
              return RawImage(image: images[state]);
            },
          ),
        ),
      ),
    );
  }
}

class GifCubit extends Cubit<int> {
  GifCubit({required this.length, this.loop = false}) : super(0);

  final int length;

  final bool loop;

  Future<void> requestFrame() async {
    await Future.delayed(const Duration(milliseconds: 43));
    final next = state + 1;
    if (!loop && next == length) {
      return;
    }
    emit(next % length);
  }
}
