part of 'about_cubit.dart';

@freezed
sealed class AboutState with _$AboutState {
  factory AboutState({@Default([]) List<ArticleEntry> articles}) = _AboutState;
}
