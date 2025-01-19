import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'gospel_cubit.freezed.dart';
part 'gospel_state.dart';

class GospelCubit extends Cubit<GospelState> {
  GospelCubit() : super(GospelState());

  final files = ['development.json', 'metadata.json', 'operations.json', 'tests.json'];

  Future<void> initialize() async {
    final navigation = <String, List<SQLEntry>>{};
    final registrar = <String, SQLEntry>{};
    for (final file in files) {
      final path = 'assets/data/metadata/types/$file';
      final data = await rootBundle.loadString(path);
      final repository = SQLRepository.fromJson(jsonDecode(data));
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
    }
    emit(
      state.copyWith(
        registrar: registrar,
        navigation: navigation,
      ),
    );
  }
}
