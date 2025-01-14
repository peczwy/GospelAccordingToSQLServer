import 'package:flutter/foundation.dart';
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
                    'assets/images/eye.png',
                    width: Consts.posterWidth,
                    height: Consts.posterHeight,
                  ),
                ),
                ready: () => _DispatcherContent(),
                willRoute: (path, gif) {
                  final cubit = context.read<DispatcherCubit>();
                  if (gif.isEmpty) {
                    context.go(path);
                    cubit.ready();
                    return const CircularProgressIndicator();
                  }
                  return Gif(
                    key: UniqueKey(),
                    images: gif,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    passpartout: true,
                    fit: BoxFit.fitWidth,
                    callback: () {
                      context.go(path);
                      cubit.ready();
                    },
                  );
                },
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
    return const SingleChildScrollView(
      child: Wrap(
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
            path: Consts.pathToPosters,
            image: AssetImage('assets/images/icons/ic_posters.png'),
          ),
          DispatcherItem(
            title: 'ONE VERY IMPORTANT THOUGHT',
            image: AssetImage('assets/images/icons/ic_chaos.png'),
            path: Consts.pathToImportant,
          ),
          if (Consts.enableRad)
            DispatcherItem(
              title: 'R&D',
              image: AssetImage('assets/images/icons/ic_rad.png'),
              path: Consts.pathToRad,
            ),
        ],
      ),
    );
  }
}
