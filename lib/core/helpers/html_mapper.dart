import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

/// Klasa pomocnicza do przeparsowywania HTML-i i mapowania DOM na listę obiektów [TextSpan]
class HtmlMapper {
  HtmlMapper({
    required this.html,
    required this.style,
    required this.anchorStyle,
  });

  /// Wejściowy HTML
  final String html;

  /// Styl tekstu
  final TextStyle style;

  /// Styl anochorów
  final TextStyle anchorStyle;

  // final TextStyle invisibleStyle = const TextStyle(color: Colors.red, fontSize: 0);
  final TextStyle invisibleStyle = const TextStyle(color: Colors.red);

  TextSpan get span => _parseNode(parseFragment(html), style: style);

  TextSpan _parseNode(
    dom.Node node, {
    required TextStyle style,
  }) {
    final children = <TextSpan>[];

    var count = 0;
    for (var child in node.nodes) {
      if (child is dom.Element) {
        children.add(switch (child.localName) {
          'p' || 'span' => _buildTextSpan(child, style: style, breakline: count > 0),
          'b' || 'strong' => _buildTextSpan(child, style: style.copyWith(fontWeight: FontWeight.bold)),
          'i' || 'em' => _buildTextSpan(child, style: style.copyWith(fontStyle: FontStyle.italic)),
          'u' => _buildTextSpan(child, style: style.copyWith(decoration: TextDecoration.underline)),
          'a' => _buildLinkSpan(child, child.attributes['href'], style: anchorStyle),
          'ul' || 'ol' => TextSpan(
              children: [
                TextSpan(text: '<${child.localName}>', style: invisibleStyle),
                TextSpan(text: '\n', style: style),
                ..._buildList(child, style: style),
                TextSpan(text: '</${child.localName}>', style: invisibleStyle),
              ],
            ),
          'li' => _buildTextSpan(child, prefix: '• ', style: style),
          'br' => TextSpan(text: '\n', style: style),
          _ => _buildTextSpan(child, style: style),
        });
      } else if (child is dom.Text) {
        children.add(TextSpan(text: child.text, style: style));
      }
      count++;
    }
    return TextSpan(children: children, style: style);
  }

  TextSpan _buildTextSpan(
    dom.Element element, {
    required TextStyle style,
    bool breakline = false,
    String? prefix,
  }) {
    return TextSpan(
      children: [
        TextSpan(text: '<${element.localName}>', style: invisibleStyle),
        TextSpan(
          // text: prefix ?? '',
          children: [
            // if (breakline) const TextSpan(text: '\n'),
            _parseNode(element, style: style),
          ],
          style: style,
        ),
        TextSpan(text: '</${element.localName}>', style: invisibleStyle),
      ],
    );
  }

  TextSpan _buildLinkSpan(
    dom.Element element,
    String? href, {
    required TextStyle style,
  }) {
    final attributes = element.attributes.entries.map((e) => '${e.key.toString()}=\"${e.value}\"').join(' ');
    return TextSpan(
      children: [
        TextSpan(text: '<${element.localName} $attributes>', style: invisibleStyle),
        TextSpan(
          text: element.text,
          style: anchorStyle,
        ),
        TextSpan(text: '</${element.localName}>', style: invisibleStyle),
      ],
    );
  }

  List<TextSpan> _buildList(
    dom.Element listElement, {
    required TextStyle style,
  }) {
    final items = <TextSpan>[];
    var index = 1;
    for (var child in listElement.children) {
      items.add(listElement.localName == 'ol'
          ? _buildTextSpan(child, prefix: '$index. ', style: style)
          : _buildTextSpan(child, prefix: '•', style: style));
      index++;
      items.add(TextSpan(text: '\n', style: style));
    }
    return items;
  }
}
