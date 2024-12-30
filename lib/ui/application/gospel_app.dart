import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class GospelApp extends StatelessWidget {
  const GospelApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createRouter();
    return MaterialApp.router(
      title: Consts.title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Consts.color),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
