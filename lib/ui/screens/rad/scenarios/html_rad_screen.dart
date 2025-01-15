import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';
import 'package:gospel_at_flutter/ui/screens/rad/cubit/rad_cubit.dart';

class HtmlRadScreen extends StatelessWidget {
  const HtmlRadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RadCubit>(
      create: (context) => RadCubit()..initialize(),
      child: BlocBuilder<RadCubit, RadState>(
        builder: (context, state) {
          final controller = HtmlTextEditingController(
            style: const TextStyle(color: Colors.black),
            anchorStyle: const TextStyle(color: Colors.blue),
          );
          controller.text = state.htmlInput;
          return TextField(
            controller: controller,
            maxLines: null,
            expands: true,
            keyboardType: TextInputType.multiline,
          );
        },
      ),
    );
  }
}
