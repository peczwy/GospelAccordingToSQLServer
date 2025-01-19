import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'posters_cubit.freezed.dart';
part 'posters_state.dart';

class PostersCubit extends Cubit<PostersState> {
  PostersCubit() : super(PostersState());

  Future<void> initialize() async {}
}
