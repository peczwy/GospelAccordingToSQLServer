import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/_exports.dart';
import 'package:flutter/services.dart' show rootBundle;

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

  @override
  Widget build(BuildContext context) {
    getFileData();
    return Text('Omnom: $title');
  }
}
