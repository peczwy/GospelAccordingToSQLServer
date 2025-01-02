import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class DispatcherScreen extends StatelessWidget {
  const DispatcherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      ),
    );
  }
}

class _DispatcherContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Wrap(
      children: [
        DispatcherItem(
          title: 'ABOUT ME',
          path: Consts.pathToAbout,
          image: AssetImage('assets/images/icons/ic_about.png'),
        ),
        DispatcherItem(
          title: 'GOSPEL ACCORDING TO SQL',
          path: '${Consts.pathToGospel}/x',
          image: AssetImage('assets/images/icons/ic_gospel.png'),
        ),
        DispatcherItem(
          title: 'POSTERS',
          path: '${Consts.pathToPosters}/x',
          image: AssetImage('assets/images/icons/ic_posters.png'),
        ),
        DispatcherItem(
          title: 'ONE VERY IMPORTANT THOUGHT',
          image: AssetImage('assets/images/icons/ic_chaos.png'),
          path: Consts.pathToImportant,
        ),
        DispatcherItem(
          title: 'R&D',
          image: AssetImage('assets/images/icons/ic_rad.png'),
          path: Consts.pathToRad,
        ),
      ],
    );
  }
}
