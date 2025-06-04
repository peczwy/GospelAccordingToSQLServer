part of 'html_editor_rad_cubit.dart';

@freezed
sealed class HtmlEditorRadState with _$HtmlEditorRadState {
  factory HtmlEditorRadState({
    TextEditingController? controller,
    @Default(true) bool visibleTags,
    @Default(14) double tagFontSize,
    int? timestamp,
  }) = _HtmlEditorRadState;
}
