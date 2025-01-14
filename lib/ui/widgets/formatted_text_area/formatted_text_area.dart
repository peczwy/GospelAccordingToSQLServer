import 'package:flutter/material.dart';

class FormattedTextArea extends StatelessWidget {
  FormattedTextArea({
    this.controller,
    this.keyboardType = TextInputType.multiline,
  });

  final TextEditingController? controller;

  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null,
      expands: true,
      keyboardType: keyboardType,
    );
  }
}
