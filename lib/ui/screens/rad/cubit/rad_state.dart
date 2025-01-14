part of 'rad_cubit.dart';

@freezed
class RadState with _$RadState {
  factory RadState({
    @Default([]) List<Image> gif,
    @Default('') String htmlInput,
    int? timestamp,
  }) = _RadState;
}
