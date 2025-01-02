import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';
import 'dart:html' as html;

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Consts.color,
        child: BlocProvider<AboutCubit>(
          create: (context) => AboutCubit()..initialize(),
          child: BlocBuilder<AboutCubit, AboutState>(
            builder: (context, state) {
              if (state.articles.isEmpty) {
                return const CircularProgressIndicator();
              }
              return SingleChildScrollView(
                child: Wrap(
                  children: [for (final article in state.articles) ArticleCard(article: article)],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final ArticleEntry article;

  void _download() => html.window.open(article.link, 'PlaceholderName');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(article.title),
          Text(article.book),
          Text(article.year.toString()),
          Text(article.authors),
          Text(article.abstract),
          MaterialButton(
            onPressed: () => _download(),
            child: const Text('DOWNLOAD'),
          ),
        ],
      ),
    );
  }
}
