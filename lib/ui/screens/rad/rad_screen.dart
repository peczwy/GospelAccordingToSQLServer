import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class RadScreen extends StatelessWidget {
  const RadScreen({
    super.key,
    this.name,
  });

  final String? name;

  RadScenario get scenario {
    final name = (this.name ?? RadScenario.HTML_EDITOR.name).toLowerCase();
    return RadScenario.values
        .firstWhere((element) => element.name.toLowerCase() == name, orElse: () => RadScenario.HTML_EDITOR);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Consts.color,
        child: Consts.enableRad
            ? switch (scenario) {
                RadScenario.GIF => const GifRadScreen(),
                _ => const HtmlRadScreen(),
              }
            : DenyWidget(),
      ),
    );
  }
}

class DenyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Text('Nothing here'));
  }
}
