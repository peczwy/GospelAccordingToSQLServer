import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class GospelScreen extends StatelessWidget {
  const GospelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Consts.color,
      child: const Text('Gospel'),
    );
  }
}
