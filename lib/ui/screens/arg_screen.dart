import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/_exports.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:html' as html;

class ArgScreen extends StatelessWidget {
  ArgScreen({
    super.key,
    required this.title,
  });

  final String title;

  Future<void> getFileData() async {
    final data = await rootBundle.loadString('data/sqls.json');
    final x = SQLRepository.fromJson(jsonDecode(data));
    print(x);
  }

  void downloadFile() {
    final url =
        'https://raw.githubusercontent.com/peczwy/GospelAccordingToSQLServer/main/public/articles/2016_detjmr.pdf';
    html.window.open(url, 'PlaceholderName');
    // html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    // anchorElement.download = url;
    // anchorElement.click();
  }

  @override
  Widget build(BuildContext context) {
    getFileData();
    return Column(
      children: [
        Text('Omnom: $title'),
        MaterialButton(
          onPressed: () => downloadFile(),
          child: Text('download'),
        ),
      ],
    );
  }
}
