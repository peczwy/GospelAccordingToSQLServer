import 'dart:async';

import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'rad_cubit.freezed.dart';
part 'rad_state.dart';

class RadCubit extends Cubit<RadState> {
  RadCubit() : super(RadState());

  Future<void> initialize() async => emit(
        state.copyWith(
          htmlInput: await rootBundle.loadString('assets/data/other/dummy_html_input.html'),
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
