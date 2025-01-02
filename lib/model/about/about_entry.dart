import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'about_entry.freezed.dart';
part 'about_entry.g.dart';

@freezed
class AboutEntry with _$AboutEntry {
  const factory AboutEntry({
    String? emoji,
    required String title,
    required String subtext,
  }) = _AboutEntry;

  factory AboutEntry.fromJson(Map<String, Object?> json) => _$AboutEntryFromJson(json);
}
