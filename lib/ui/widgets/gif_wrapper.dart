import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class GifWrapper extends StatefulWidget {
  const GifWrapper({
    super.key,
    required this.image,
    this.listener,
  });

  final ImageProvider image;

  final AnimationStatusListener? listener;

  @override
  State<StatefulWidget> createState() => _GifWrapperState();
}

class _GifWrapperState extends State<GifWrapper> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final controller = GifController(vsync: this);
    controller.addStatusListener((status) {
      final listener = widget.listener;
      if (listener != null) {
        listener(status);
      }
    });
    return Gif(
      image: widget.image,
      controller: controller,
      autostart: Autostart.once,
      placeholder: (context) => const CircularProgressIndicator(),
      onFetchCompleted: () {
        controller.reset();
        controller.forward();
      },
    );
  }
}
