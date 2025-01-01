import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'sql_entry.freezed.dart';
part 'sql_entry.g.dart';

@freezed
class SQLEntry with _$SQLEntry {
  const factory SQLEntry({
    required String key,
    required String title,
    required String type,
    required String description,
    required String? sql,
    @JsonKey(name: 'sql_file') required String? sqlFile,
    required String? source,
  }) = _SQLEntry;

  factory SQLEntry.fromJson(Map<String, Object?> json) => _$SQLEntryFromJson(json);
}
