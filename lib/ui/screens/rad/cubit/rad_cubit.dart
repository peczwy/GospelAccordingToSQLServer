import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'rad_cubit.freezed.dart';
part 'rad_state.dart';

class RadCubit extends Cubit<RadState> {
  RadCubit() : super(RadState());

  Future<void> initialize() async {
    // final data = await rootBundle.loadString('data/metadata/sqls.json');
    // final repository = SQLRepository.fromJson(jsonDecode(data));
  }
}
