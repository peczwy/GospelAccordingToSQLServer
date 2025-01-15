import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class HtmlTextEditingController extends TextEditingController {
  HtmlTextEditingController({
    required this.style,
    required this.anchorStyle,
    required this.tagStyle,
  });

  final TextStyle style;
  final TextStyle anchorStyle;

  final TextStyle tagStyle;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) =>
      HtmlMapper(html: text, style: this.style, anchorStyle: anchorStyle, tagStyle: tagStyle).span;

  @override
  set text(String newText) {
    value = value.copyWith(
      text: HtmlMapper(html: newText, style: style, anchorStyle: anchorStyle, tagStyle: tagStyle).span.toPlainText(),
      selection: const TextSelection.collapsed(offset: -1),
      composing: TextRange.empty,
    );
  }

  @override
  set value(TextEditingValue newValue) {
    super.value = newValue.copyWith(
      text: HtmlMapper(html: newValue.text, style: style, anchorStyle: anchorStyle, tagStyle: tagStyle)
          .span
          .toPlainText(),
    );
  }
}
