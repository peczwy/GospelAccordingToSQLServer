import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'sql_repository.freezed.dart';
part 'sql_repository.g.dart';

@freezed
class SQLRepository with _$SQLRepository {
  const factory SQLRepository({
    required List<SQLEntry> sqls,
  }) = _SQLRepository;

  factory SQLRepository.fromJson(Map<String, Object?> json) => _$SQLRepositoryFromJson(json);
}
