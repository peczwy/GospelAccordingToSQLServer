import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'html_editor_rad_cubit.freezed.dart';
part 'html_editor_rad_state.dart';

class HtmlEditorRadCubit extends Cubit<HtmlEditorRadState> {
  HtmlEditorRadCubit() : super(HtmlEditorRadState());

  Future<TextEditingController> _createController({
    bool? visibleTags,
    double? tagSize,
  }) async {
    final existingController = state.controller;
    final input = existingController?.text ?? await rootBundle.loadString('assets/data/other/dummy_html_input.html');
    final controller = HtmlTextEditingController(
      style: const TextStyle(color: Colors.black),
      anchorStyle: const TextStyle(color: Colors.blue),
      tagStyle: visibleTags ?? state.visibleTags
          ? TextStyle(color: Colors.red, fontSize: tagSize ?? state.tagFontSize)
          : const TextStyle(color: Colors.transparent, fontSize: 0),
    );
    controller.text = input;
    return controller;
  }

  Future<void> initialize() async {
    final controller = await _createController();
    emit(
      state.copyWith(
        controller: controller,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> setTagVisibility(bool visibility) async {
    final controller = await _createController(visibleTags: visibility);
    emit(
      state.copyWith(
        controller: controller,
        visibleTags: visibility,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> setTagSize(double size) async {
    final controller = await _createController(tagSize: size);
    emit(
      state.copyWith(
        controller: controller,
        tagFontSize: size,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
}
