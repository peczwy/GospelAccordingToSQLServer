import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class TextOverlay extends StatelessWidget {
  const TextOverlay({
    super.key,
    required this.text,
    required this.child,
    this.style,
    this.height,
    this.width,
  });

  final String text;

  final TextStyle? style;

  final Widget child;

  final double? width;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ShaderMask(
          blendMode: BlendMode.srcOut,
          shaderCallback: (bounds) {
            return const LinearGradient(colors: [
              Colors.black,
              Colors.black,
            ]).createShader(bounds);
          },
          child: Container(
            width: width,
            height: height,
            color: Colors.transparent,
            child: Center(
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  text.toUpperCase(),
                  style: TextStyle(fontSize: 300, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
