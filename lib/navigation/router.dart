import 'package:gospel_at_flutter/gospel_at_flutter.dart';

GoRouter createRouter() => GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => TestScreen(),
          routes: [
            GoRoute(
              path: '/bump/:name',
              builder: (context, state) => ArgScreen(
                title: state.pathParameters["name"] ?? "",
              ),
              routes: [],
            ),
          ],
        ),
      ],
    );
