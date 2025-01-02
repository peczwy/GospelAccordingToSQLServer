part of 'dispatcher_cubit.dart';

@freezed
class DispatcherState with _$DispatcherState {
  const factory DispatcherState.willRoute({required String path, @Default([]) List<Image> gif}) = _WillRoute;
  const factory DispatcherState.initial({required double opacity}) = _Initial;
  const factory DispatcherState.ready() = _Ready;
}
