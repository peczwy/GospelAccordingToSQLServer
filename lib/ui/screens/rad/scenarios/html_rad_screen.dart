import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';
import 'package:gospel_at_flutter/ui/screens/rad/scenarios/cubit/html_editor_rad_cubit.dart';

class HtmlRadScreen extends StatelessWidget {
  const HtmlRadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HtmlEditorRadCubit>(
      create: (context) => HtmlEditorRadCubit()..initialize(),
      child: BlocBuilder<HtmlEditorRadCubit, HtmlEditorRadState>(
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
