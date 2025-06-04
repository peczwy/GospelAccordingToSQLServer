part of 'gif_rad_cubit.dart';

@freezed
sealed class GifRadState with _$GifRadState {
  factory GifRadState({
    @Default([]) List<Image> gif,
    int? timestamp,
  }) = _GifRadState;
}
