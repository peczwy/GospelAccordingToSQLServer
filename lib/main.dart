import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

void main() {
  usePathUrlStrategy();
  runApp(const GospelApp());
}
