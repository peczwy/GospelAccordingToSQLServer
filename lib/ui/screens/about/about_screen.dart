import 'package:flutter/cupertino.dart';
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        const AboutFields(),
                        const Align(
                          child: Text(
                            'BIO',
                            textAlign: TextAlign.center,
                            style: Consts.typographyHeader,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(Consts.padding),
                          child: SelectionArea(
                            child: Text.rich(
                              textAlign: TextAlign.justify,
                              TextSpan(
                                children: [
                                  const TextSpan(text: 'Full-time foul-mouthed architect in Vulcan Sp. z o.o. and '),
                                  TextSpan(
                                    text: 'half-time assistant in Rzeszow University of Technology ',
                                    style: Consts.typography.copyWith(decoration: TextDecoration.lineThrough),
                                  ),
                                  const TextSpan(
                                      text:
                                          '(former) whose main area of interest satellites around data. Query optimization, data storage, data processing, warehousing, ETLs, VIMs, Stream Processing and big '),
                                  TextSpan(
                                    text: 'data ',
                                    style: Consts.typography.copyWith(decoration: TextDecoration.lineThrough),
                                  ),
                                  const TextSpan(
                                      text:
                                          'whatever -= good chances are that at some point I had read the heckload of books/articles concerning these topics. Recently more involved in DevOps and mobile development (and never really got into it). Sidequesting-in-security. Bookworm. Cinephile. '),
                                  TextSpan(
                                    text: 'Also having hate-hate relationship with Social Networks.',
                                    style: Consts.typography.copyWith(fontStyle: FontStyle.italic),
                                  ),
                                ],
                              ),
                              style: Consts.typography,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Align(
                      child: Text(
                        'ARTICLES',
                        textAlign: TextAlign.center,
                        style: Consts.typographyHeader,
                      ),
                    ),
                    Wrap(
                      children: [for (final article in state.articles) ArticleCard(article: article)],
                    )
                  ],
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

  void _download() => html.window.open(article.link, article.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SelectableText(
            article.title,
            style: Consts.typography,
          ),
          SelectableText(
            article.book,
            style: Consts.typography,
          ),
          SelectableText(
            article.year.toString(),
            style: Consts.typography,
          ),
          SelectableText(
            article.authors,
            style: Consts.typography,
          ),
          SelectableText(
            article.abstract,
            style: Consts.typography,
          ),
          SelectableText(
            article.abstract,
            style: Consts.typography,
          ),
          MaterialButton(
            onPressed: () => _download(),
            child: const Icon(Icons.download),
          ),
        ],
      ),
    );
  }
}

class AboutFields extends StatelessWidget {
  const AboutFields({super.key});

  final items = const <AboutEntry>[
    AboutEntry(
      title: 'Database Management Systems',
      subtext: 'NoSQL, NewSQL, RDBMS, OLTP, OLAP, Big Data',
      emoji: '🛢️',
    ),
    AboutEntry(
      title: 'Stream Processing',
      subtext: 'Kafka, Samza, Storm, Spark',
      emoji: '⚡',
    ),
    AboutEntry(
      title: 'Data Mining / Data Science / Data Analysis',
      subtext: '... and other things in R',
      emoji: '📈',
    ),
    AboutEntry(
      title: 'IT Security',
      subtext: 'preach and teach',
      emoji: '👮‍♂',
    ),
    AboutEntry(
      title: 'DevOps',
      subtext: 'virtualization, containers, app deployment, configuration management, ...',
      emoji: '🏭',
    ),
    AboutEntry(
      title: 'Software Engineering',
      subtext: 'Design Patterns, Languages, ....',
      emoji: '⌨',
    ),
    AboutEntry(
      title: 'Dentistry',
      subtext: '... I guess ...',
      emoji: '🦷',
    ),
    AboutEntry(
      title: 'Sewing',
      subtext: 'Haute Couture and other s*** like that...',
      emoji: '🧵',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Wrap(
        children: [
          for (final item in items)
            SizedBox(
              height: Consts.fieldsBoxSize,
              width: Consts.fieldsBoxSize,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (item.emoji != null)
                    Text(
                      item.emoji!,
                      textAlign: TextAlign.center,
                      style: Consts.typographyEmoji,
                    ),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: Consts.typography,
                  ),
                  Text(
                    item.subtext,
                    textAlign: TextAlign.center,
                    style: Consts.typography.copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
