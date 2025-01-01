import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

GoRouter createRouter() => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const DispatcherScreen(),
          routes: [
            GoRoute(
              path: Consts.pathToAbout,
              builder: (context, state) => Text('placeholder'),
            ),
            GoRoute(
              path: '${Consts.pathToGospel}/:name',
              builder: (context, state) => ArgScreen(
                title: state.pathParameters["name"] ?? "",
              ),
            ),
            GoRoute(
              path: '${Consts.pathToPosters}/:name',
              builder: (context, state) => ArgScreen(
                title: state.pathParameters["name"] ?? "",
              ),
            ),
            GoRoute(
              path: Consts.pathToImportant,
              builder: (context, state) => const ImportantScreen(),
            ),
          ],
        ),
      ],
    );
