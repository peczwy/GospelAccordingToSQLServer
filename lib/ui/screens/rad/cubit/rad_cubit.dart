import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'rad_cubit.freezed.dart';
part 'rad_state.dart';

class RadCubit extends Cubit<RadState> {
  RadCubit() : super(RadState());

  Future<void> initialize() async {
    emit(
      RadState(
        gif: await GifGenerator.instance.current,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> refresh() async => initialize();

  Future<void> next() async => GifGenerator.instance.landing();
}
