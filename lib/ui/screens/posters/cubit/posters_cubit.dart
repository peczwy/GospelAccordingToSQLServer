import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'posters_cubit.freezed.dart';
part 'posters_state.dart';

class PostersCubit extends Cubit<PostersState> {
  PostersCubit() : super(PostersState());

  Future<void> initialize() async {
    final data = await rootBundle.loadString('data/metadata/sqls.json');
    final repository = SQLRepository.fromJson(jsonDecode(data));
  }
}
