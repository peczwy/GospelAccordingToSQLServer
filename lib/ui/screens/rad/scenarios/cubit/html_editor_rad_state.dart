part of 'html_editor_rad_cubit.dart';

@freezed
class HtmlEditorRadState with _$HtmlEditorRadState {
  factory HtmlEditorRadState({
    @Default('') String htmlInput,
    int? timestamp,
  }) = _HtmlEditorRadState;
}
