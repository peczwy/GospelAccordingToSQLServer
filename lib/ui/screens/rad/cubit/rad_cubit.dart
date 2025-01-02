import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'rad_cubit.freezed.dart';
part 'rad_state.dart';

class RadCubit extends Cubit<RadState> {
  RadCubit() : super(RadState());

  Future<void> initialize() async {
    // unawaited(GifGenerator.instance.landing());
    emit(
      RadState(
        gif: await GifGenerator.instance.current,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> next() async => initialize();
}
