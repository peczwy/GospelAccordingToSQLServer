import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/_exports.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';
import 'dart:html' as html;

class GospelScreen extends StatelessWidget {
  const GospelScreen({
    super.key,
    this.name,
  });

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Consts.color,
        child: BlocProvider<GospelCubit>(
          create: (context) => GospelCubit()..initialize(),
          child: BlocBuilder<GospelCubit, GospelState>(
            builder: (context, state) {
              if (state.registrar.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              final entry = state.registrar[name] ?? state.registrar.entries.first.value;

              /// TODO: better flex
              final width = MediaQuery.of(context).size.width;
              return Row(
                children: [
                  Expanded(
                    flex: width > 800 ? 2 : 1,
                    child: GospelNavigation(
                      selected: entry,
                      navigation: state.navigation,
                      registrar: state.registrar.entries.map((e) => e.value).toList(),
                    ),
                  ),
                  Expanded(
                    flex: width > 800 ? 10 : 3,
                    child: GospelContent(entry: entry),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class GospelNavigation extends StatelessWidget {
  const GospelNavigation({
    super.key,
    required this.selected,
    required this.navigation,
    required this.registrar,
  });

  final SQLEntry selected;
  final List<SQLEntry> registrar;
  final Map<String, List<SQLEntry>> navigation;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: registrar.length,
      itemBuilder: (context, index) {
        return Material(
          type: MaterialType.transparency,
          child: ListTile(
            title: Text(
              registrar[index].title.toUpperCase(),
              style: Consts.typography.copyWith(
                fontWeight: registrar[index].key == selected.key ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            onTap: () => context.go('${Consts.pathToGospel}/${registrar[index].key}'),
            hoverColor: Consts.color.darken(),
          ),
        );
      },
    );
  }
}

class GospelContent extends StatelessWidget {
  const GospelContent({
    super.key,
    required this.entry,
  });

  final SQLEntry entry;

  @override
  Widget build(BuildContext context) {
    final controller = FormattedTextEditingController(
      styles: TextPartStyleDefinitions(
        definitionList: [
          TextPartStyleDefinition(
            pattern: r'--.+',
            style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          TextPartStyleDefinition(
            pattern:
                r'(?<=\W|^)(SELECT|FROM|WHERE|ON|JOIN|AND|OR|GROUP|BY|HAVING|ORDER|INNER|OUTER|LEFT|RIGHT|JOIN|IF|EXISTS|NOT|CREATE|UPDATE|DELETE|INDEX|GO|GOTO|DBCC|ALTER|DROP|WITH|AS|CROSS|APPLY|DATABASE|SET|WITH|DECLARE|UNION|INTERSECT|EXCEPT|ALL|INSERT|PRIMARY|FOREIGN|KEY|UNIQUE|CONSTRAINT|BEGIN|END|TRY|CATCH|TABLE|VIEW|ADD|REFERENCES|USE|ASC|DESC)(?=\W|$)',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
          ),
        ],
      ),
    );
    controller.text = entry.sql ?? controller.text;
    return SelectionArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'DESCRIPTION',
            textAlign: TextAlign.justify,
            style: Consts.typographyHeader,
          ),
          Text(
            entry.description,
            textAlign: TextAlign.justify,
            style: Consts.typography,
          ),
          if (entry.source != null) SizedBox(height: Consts.padding),
          if (entry.source != null)
            const Text(
              'SOURCE',
              textAlign: TextAlign.justify,
              style: Consts.typographyHeader,
            ),
          if (entry.source != null) Source(link: entry.source!),
          SizedBox(height: Consts.padding),
          const Text(
            'SCRIPT',
            textAlign: TextAlign.justify,
            style: Consts.typographyHeader,
          ),
          Expanded(
            child: FormattedTextArea(
              controller: controller,
              keyboardType: TextInputType.multiline,
            ),
          ),
        ],
      ),
    );
  }
}

class Source extends StatelessWidget {
  Source({
    super.key,
    required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) => InkWell(
        child: Text(
          link,
          textAlign: TextAlign.justify,
          style: Consts.typography,
        ),
        onTap: () => html.window.open(link, 'new tab'),
      );
}
