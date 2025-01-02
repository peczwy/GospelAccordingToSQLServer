part of 'rad_cubit.dart';

@freezed
class RadState with _$RadState {
  factory RadState({
    ImageProvider? gif,
    int? timestamp,
  }) = _RadState;
}
