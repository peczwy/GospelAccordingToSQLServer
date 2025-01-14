import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

/// Kudos: <a href="https://www.flutterclutter.dev/flutter/tutorials/styling-parts-of-a-textfield/2021/101326/">https://www.flutterclutter.dev/flutter/tutorials/styling-parts-of-a-textfield/2021/101326/</a>
class FormattedTextEditingController extends TextEditingController {
  FormattedTextEditingController({
    this.styles = const TextPartStyleDefinitions(),
  }) : combinedPattern = styles.createCombinedPatternBasedOnStyleMap();

  final TextPartStyleDefinitions styles;

  final Pattern combinedPattern;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final List<InlineSpan> textSpanChildren = <InlineSpan>[];

    text.splitMapJoin(
      combinedPattern,
      onMatch: (Match match) {
        final String? textPart = match.group(0);

        if (textPart == null) return '';

        final TextPartStyleDefinition? styleDefinition = styles.getStyleOfTextPart(
          textPart,
          text,
        );

        if (styleDefinition == null) return '';

        _addTextSpan(
          textSpanChildren,
          textPart,
          style?.merge(styleDefinition.style),
        );

        return '';
      },
      onNonMatch: (String text) {
        _addTextSpan(textSpanChildren, text, style);

        return '';
      },
    );

    return TextSpan(style: style, children: textSpanChildren);
  }

  void _addTextSpan(
    List<InlineSpan> textSpanChildren,
    String? textToBeStyled,
    TextStyle? style,
  ) {
    textSpanChildren.add(
      TextSpan(
        text: textToBeStyled,
        style: style,
      ),
    );
  }
}
