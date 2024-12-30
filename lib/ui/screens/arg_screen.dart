import 'package:flutter/material.dart';

class ArgScreen extends StatelessWidget {
  ArgScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text('Omnom: $title');
  }
}
