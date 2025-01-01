import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class ImportantScreen extends StatelessWidget {
  const ImportantScreen({super.key});

  static const elementId = 'important_message';

  @override
  Widget build(BuildContext context) {
    platformViewRegistry.registerViewFactory(
      elementId,
      (int id) => IFrameElement()
        ..width = MediaQuery.of(context).size.width.toString()
        ..height = MediaQuery.of(context).size.height.toString()
        ..src = Consts.importantUrl
        ..allowFullscreen = true
        ..allow = 'encrypted-media;autoplay'
        ..style.border = 'none',
    );

    return Container(
      color: Consts.color,
      child: const HtmlElementView(viewType: elementId),
    );
  }
}
