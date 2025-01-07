import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

part 'about_cubit.freezed.dart';
part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutState());

  Future<void> initialize() async {
    final data = await rootBundle.loadString('assets/data/metadata/articles.json');
    final repository = ArticleRepository.fromJson(jsonDecode(data));
    final articles = repository.articles.toList();
    articles.sort((a, b) {
      final compare = a.year.compareTo(b.year);
      return compare == 0 ? a.title.compareTo(b.title) : compare;
    });
    emit(AboutState(articles: articles));
  }
}
