import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class DispatcherItem extends StatelessWidget {
  const DispatcherItem({
    super.key,
    required this.path,
    required this.title,
  });

  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => context.go(path),
      child: SizedBox(
        height: 200,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_forward),
            Text(title),
          ],
        ),
      ),
    );
  }
}
