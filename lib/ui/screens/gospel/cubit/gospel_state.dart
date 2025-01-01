part of 'gospel_cubit.dart';

@freezed
class GospelState with _$GospelState {
  factory GospelState({
    @Default({}) Map<String, List<SQLEntry>> navigation,
    @Default({}) Map<String, SQLEntry> registrar,
  }) = _GospelState;
}
