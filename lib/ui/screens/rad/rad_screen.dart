import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';
import 'dart:html' as html;

class RadScreen extends StatelessWidget {
  const RadScreen({super.key});

  Future<void> getFileData() async {
    final data = await rootBundle.loadString('data/metadata/sqls.json');
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
    return Container(
      color: Consts.color,
      child: const Text('R&D'),
    );
  }
}
