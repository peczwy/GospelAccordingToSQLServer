import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/_exports.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class GospelContent extends StatelessWidget {
  const GospelContent({
    super.key,
    required this.entry,
  });

  final SQLEntry entry;

  @override
  Widget build(BuildContext context) {
    final controller = RegexTextEditingController(
      styles: TextPartStyleDefinitions(
        definitions: [
          TextPartStyleDefinition(
            pattern: Consts.commentRegex,
            style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          TextPartStyleDefinition(
            pattern: Consts.SQLRegex,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
          ),
        ],
      ),
    );
    controller.text = entry.sql ?? controller.text;
    return SelectionArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DESCRIPTION',
            textAlign: TextAlign.justify,
            style: Consts.typographyHeader,
          ),
          Text(
            entry.description,
            textAlign: TextAlign.justify,
            style: Consts.typography,
          ),
          if (entry.source != null) SizedBox(height: Consts.padding),
          if (entry.source != null)
            const Text(
              'SOURCE',
              textAlign: TextAlign.justify,
              style: Consts.typographyHeader,
            ),
          if (entry.source != null) Source(link: entry.source!),
          SizedBox(height: Consts.padding),
          const Text(
            'SCRIPT',
            textAlign: TextAlign.justify,
            style: Consts.typographyHeader,
          ),
          Expanded(
            child: TextField(
              controller: controller,
              maxLines: null,
              expands: true,
              keyboardType: TextInputType.multiline,
            ),
          ),
        ],
      ),
    );
  }
}

class Source extends StatelessWidget {
  Source({
    super.key,
    required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) => InkWell(
        child: Text(
          link,
          textAlign: TextAlign.justify,
          style: Consts.typography,
        ),
        onTap: () => html.window.open(link, 'new tab'),
      );
}
