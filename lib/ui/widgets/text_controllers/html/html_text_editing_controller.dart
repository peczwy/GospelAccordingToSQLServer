import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class HtmlTextEditingController extends TextEditingController {
  HtmlTextEditingController({
    required this.style,
    required this.anchorStyle,
  });

  final TextStyle style;
  final TextStyle anchorStyle;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) =>
      HtmlMapper(html: text, style: this.style, anchorStyle: anchorStyle).span;
}
