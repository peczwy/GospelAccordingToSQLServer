import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color darken({double factor = 0.1}) => Color.lerp(this, Colors.black, factor) ?? this;

  Color brighten({double factor = 0.1}) => Color.lerp(this, Colors.white, factor) ?? this;
}
