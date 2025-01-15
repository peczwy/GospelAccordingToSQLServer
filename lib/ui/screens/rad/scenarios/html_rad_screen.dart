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
          final controller = state.controller;
          if (controller == null) {
            return const CircularProgressIndicator();
          }
          return Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      const Text('Visible Tags'),
                      Checkbox(
                        checkColor: Colors.white,
                        value: state.visibleTags,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<HtmlEditorRadCubit>().setTagVisibility(value);
                          }
                        },
                      ),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    children: [
                      const Text('Tags Size'),
                      DropdownButton<double>(
                        value: state.tagFontSize,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            context.read<HtmlEditorRadCubit>().setTagSize(value);
                          }
                        },
                        items: [for (var i = 0; i < 20; ++i) i].map((value) {
                          return DropdownMenuItem<double>(
                            value: value.toDouble(),
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
