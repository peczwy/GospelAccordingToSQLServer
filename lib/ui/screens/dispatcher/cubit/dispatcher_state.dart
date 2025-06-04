part of 'dispatcher_cubit.dart';

@freezed
sealed class DispatcherState with _$DispatcherState {
  const factory DispatcherState.willRoute({required String path, @Default([]) List<Image> gif}) = WillRoute;
  const factory DispatcherState.initial({required double opacity}) = Initial;
  const factory DispatcherState.ready() = Ready;
}
