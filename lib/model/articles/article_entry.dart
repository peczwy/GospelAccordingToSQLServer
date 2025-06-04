import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'article_entry.freezed.dart';
part 'article_entry.g.dart';

@freezed
sealed class ArticleEntry with _$ArticleEntry {
  const ArticleEntry._();

  const factory ArticleEntry({
    required String link,
    required String title,
    required String authors,
    required int year,
    required String book,
    required String abstract,
  }) = _ArticleEntry;

  factory ArticleEntry.fromJson(Map<String, Object?> json) => _$ArticleEntryFromJson(json);

  String get text => '$title ($year)';
}
