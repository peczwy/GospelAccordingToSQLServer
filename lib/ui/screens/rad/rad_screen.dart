import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class RadScreen extends StatelessWidget {
  const RadScreen({super.key});

  Future<void> getFileData() async {
    final data = await rootBundle.loadString('data/metadata/sqls.json');
    final x = SQLRepository.fromJson(jsonDecode(data));
    print(x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Consts.color,
        child: BlocProvider<AboutCubit>(
          create: (context) => AboutCubit()..initialize(),
          child: Text('R&D'),
        ),
      ),
    );
  }
}
