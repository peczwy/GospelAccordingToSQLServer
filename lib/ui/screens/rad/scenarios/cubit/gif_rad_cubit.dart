import 'dart:async';
import 'dart:ui';

import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'gif_rad_cubit.freezed.dart';
part 'gif_rad_state.dart';

class GifRadCubit extends Cubit<GifRadState> {
  GifRadCubit() : super(GifRadState());

  Future<void> initialize() async => emit(
        state.copyWith(
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );

  Future<void> hide() async => emit(
        state.copyWith(
          gif: [],
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );

  Future<void> next() async => emit(
        state.copyWith(
          gif: await GifGenerator.instance.next(length: 32),
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
      );
}
