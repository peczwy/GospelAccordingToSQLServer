import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

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
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GospelNavigation(
                      selected: entry,
                      navigation: state.navigation,
                      registrar: state.registrar.entries.map((e) => e.value).toList(),
                    ),
                  ),
                  Expanded(
                    flex: 10,
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
            hoverColor: Color.lerp(Consts.color, Colors.black, 0.1),
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
    return SelectableText(entry.sql ?? '');
  }
}
