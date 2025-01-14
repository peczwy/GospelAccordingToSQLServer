import 'package:gospel_at_flutter/gospel_at_flutter.dart';

/// Kudos: <a href="https://www.flutterclutter.dev/flutter/tutorials/styling-parts-of-a-textfield/2021/101326/">https://www.flutterclutter.dev/flutter/tutorials/styling-parts-of-a-textfield/2021/101326/</a>
class TextPartStyleDefinitions {
  const TextPartStyleDefinitions({
    this.definitionList = const [],
  });

  final List<TextPartStyleDefinition> definitionList;

  RegExp createCombinedPatternBasedOnStyleMap() {
    final String combinedPatternString = definitionList
        .map<String>(
          (TextPartStyleDefinition textPartStyleDefinition) => textPartStyleDefinition.pattern,
        )
        .join('|');

    return RegExp(
      combinedPatternString,
      multiLine: true,
      caseSensitive: false,
    );
  }

  TextPartStyleDefinition? getStyleOfTextPart(
    String textPart,
    String text,
  ) {
    return List<TextPartStyleDefinition?>.from(definitionList).firstWhere(
      (TextPartStyleDefinition? styleDefinition) {
        if (styleDefinition == null) return false;

        bool hasMatch = false;

        RegExp(styleDefinition.pattern, caseSensitive: false).allMatches(text).forEach(
          (RegExpMatch currentMatch) {
            if (hasMatch) return;

            if (currentMatch.group(0) == textPart) {
              hasMatch = true;
            }
          },
        );

        return hasMatch;
      },
      orElse: () => null,
    );
  }
}
