import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'rad_cubit.freezed.dart';
part 'rad_state.dart';

class RadCubit extends Cubit<RadState> {
  RadCubit() : super(RadState());

  Future<void> initialize() async {
    emit(
      RadState(
        gif: const AssetImage('images/landing.gif'),
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> next() async => initialize();
}
