import 'package:gospel_at_flutter/gospel_at_flutter.dart';

/// Kudos: <a href="https://www.flutterclutter.dev/flutter/tutorials/styling-parts-of-a-textfield/2021/101326/">https://www.flutterclutter.dev/flutter/tutorials/styling-parts-of-a-textfield/2021/101326/</a>
class TextPartStyleDefinitions {
  const TextPartStyleDefinitions({
    this.definitions = const [],
  });

  final List<TextPartStyleDefinition> definitions;

  RegExp get combinedPattern => RegExp(
        definitions.map((textPartStyleDefinition) => textPartStyleDefinition.pattern).join('|'),
        multiLine: true,
        caseSensitive: false,
      );

  TextPartStyleDefinition? getStyleOfTextPart(
    String textPart,
    String text,
  ) {
    return List<TextPartStyleDefinition?>.from(definitions).firstWhere(
      (styleDefinition) {
        if (styleDefinition == null) {
          return false;
        }

        var hasMatch = false;

        RegExp(styleDefinition.pattern, caseSensitive: false).allMatches(text).forEach(
          (currentMatch) {
            if (hasMatch) {
              return;
            }
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
