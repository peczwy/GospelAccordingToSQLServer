import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'article_repository.freezed.dart';
part 'article_repository.g.dart';

@freezed
class ArticleRepository with _$ArticleRepository {
  const factory ArticleRepository({
    required List<SQLEntry> articles,
  }) = _ArticleRepository;

  factory ArticleRepository.fromJson(Map<String, Object?> json) => _$ArticleRepositoryFromJson(json);
}
