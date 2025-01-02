import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class PostersScreen extends StatelessWidget {
  const PostersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Consts.color,
        child: BlocProvider<AboutCubit>(
          create: (context) => AboutCubit()..initialize(),
          child: Text('Posters'),
        ),
      ),
    );
  }
}
