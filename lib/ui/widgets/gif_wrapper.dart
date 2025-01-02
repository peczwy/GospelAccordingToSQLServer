import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class GifWrapper extends StatefulWidget {
  const GifWrapper({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.passpartout = false,
    this.listener,
  });

  final ImageProvider image;

  final AnimationStatusListener? listener;

  final double? width;

  final double? height;

  final bool passpartout;

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
    return Container(
      color: widget.passpartout ? Colors.black : Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(widget.passpartout ? 100 : 0),
        child: Gif(
          image: widget.image,
          height: widget.height,
          width: widget.width,
          fit: BoxFit.fill,
          controller: controller,
          autostart: Autostart.once,
          placeholder: (context) => const CircularProgressIndicator(),
          onFetchCompleted: () {
            controller.reset();
            controller.forward();
          },
        ),
      ),
    );
  }
}
