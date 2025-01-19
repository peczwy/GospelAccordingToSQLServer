import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/_exports.dart';
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
