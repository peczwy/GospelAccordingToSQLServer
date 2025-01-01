import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class DispatcherScreen extends StatelessWidget {
  const DispatcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Consts.color,
      child: BlocProvider<DispatcherCubit>(
        create: (context) => DispatcherCubit()..initialize(),
        child: Center(
          child: BlocBuilder<DispatcherCubit, DispatcherState>(
            builder: (context, state) => state.when(
              initial: (opacity) => AnimatedOpacity(
                opacity: opacity,
                duration: Consts.fadeLinger,
                child: Image.asset(
                  'images/eye.png',
                  width: 376,
                  height: 539,
                ),
              ),
              ready: () => _DispatcherContent(),
            ),
          ),
        ),
      ),
    );
  }
}

class _DispatcherContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DispatcherItem(
          title: 'About',
          path: Consts.pathToAbout,
        ),
        DispatcherItem(
          title: 'Gospel',
          path: Consts.pathToGospel,
        ),
        DispatcherItem(
          title: 'Posters',
          path: Consts.pathToPosters,
        ),
        DispatcherItem(
          title: 'Important',
          path: Consts.pathToImportant,
        ),
      ],
    );
  }
}
