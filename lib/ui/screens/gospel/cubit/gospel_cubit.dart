import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'gospel_cubit.freezed.dart';
part 'gospel_state.dart';

class GospelCubit extends Cubit<GospelState> {
  GospelCubit() : super(GospelState());

  Future<void> initialize() async {
    final data = await rootBundle.loadString('assets/data/metadata/sqls.json');
    final repository = SQLRepository.fromJson(jsonDecode(data));
    final navigation = <String, List<SQLEntry>>{};
    final registrar = <String, SQLEntry>{};
    for (final sql in repository.sqls) {
      final key = sql.type;
      if (!navigation.containsKey(key)) {
        navigation[key] = [];
      }
      final list = navigation[key] ?? [];
      if (sql.sql == null) {
        final file = sql.sqlFile;
        if (file != null) {
          final content = await rootBundle.loadString(file);
          final sanitized = sql.copyWith(sql: content);
          list.add(sanitized);
          registrar[sql.key] = sanitized;
        }
      } else {
        list.add(sql);
        registrar[sql.key] = sql;
      }
    }
    emit(
      state.copyWith(
        registrar: registrar,
        navigation: navigation,
      ),
    );
  }
}
