import 'dart:async';

import 'package:flutter/services.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'html_editor_rad_cubit.freezed.dart';
part 'html_editor_rad_state.dart';

class HtmlEditorRadCubit extends Cubit<HtmlEditorRadState> {
  HtmlEditorRadCubit() : super(HtmlEditorRadState());

  Future<void> initialize() async => emit(
        state.copyWith(
          htmlInput: await rootBundle.loadString('assets/data/other/dummy_html_input.html'),
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
}
