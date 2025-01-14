import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

/// Kudos: <a href="https://www.flutterclutter.dev/flutter/tutorials/styling-parts-of-a-textfield/2021/101326/">https://www.flutterclutter.dev/flutter/tutorials/styling-parts-of-a-textfield/2021/101326/</a>
class RegexTextEditingController extends TextEditingController {
  RegexTextEditingController({
    this.styles = const TextPartStyleDefinitions(),
  }) : combinedPattern = styles.combinedPattern;

  final TextPartStyleDefinitions styles;

  final Pattern combinedPattern;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final children = <InlineSpan>[];

    text.splitMapJoin(
      combinedPattern,
      onMatch: (Match match) {
        final String? textPart = match.group(0);

        if (textPart == null) {
          return '';
        }

        final styleDefinition = styles.getStyleOfTextPart(
          textPart,
          text,
        );
        if (styleDefinition == null) {
          return '';
        }
        children.add(TextSpan(text: textPart, style: style?.merge(styleDefinition.style)));
        return '';
      },
      onNonMatch: (String text) {
        children.add(TextSpan(text: text, style: style));
        return '';
      },
    );

    return TextSpan(style: style, children: children);
  }
}
