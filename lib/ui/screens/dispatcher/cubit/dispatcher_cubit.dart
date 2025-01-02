import 'dart:async';
import 'dart:ui';

import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'dispatcher_cubit.freezed.dart';
part 'dispatcher_state.dart';

class DispatcherCubit extends Cubit<DispatcherState> {
  DispatcherCubit() : super(const DispatcherState.initial(opacity: 0));

  Future<void> initialize() async {
    if (!isClosed) {
      unawaited(GifGenerator.instance.prepare());
      await Future.delayed(Consts.fadeWarmup);
      emit(const DispatcherState.initial(opacity: 1));
      await Future.delayed(Consts.fadeSustain);
      emit(const DispatcherState.initial(opacity: 0));
      await Future.delayed(Consts.fadeLinger);
      emit(const DispatcherState.ready());
    }
  }

  Future<void> route(String path) async {
    emit(
      DispatcherState.willRoute(
        path: path,
        gif: await GifGenerator.instance.next(),
      ),
    );
  }

  void ready() {
    emit(const DispatcherState.ready());
  }
}
