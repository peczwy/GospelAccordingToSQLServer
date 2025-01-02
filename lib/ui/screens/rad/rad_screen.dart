import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';
import 'package:gospel_at_flutter/ui/screens/rad/cubit/rad_cubit.dart';

class RadScreen extends StatelessWidget {
  const RadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Consts.color,
        child: BlocProvider<RadCubit>(
          create: (context) => RadCubit()..initialize(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<RadCubit, RadState>(
                  builder: (context, state) {
                    final gif = state.gif;
                    return gif == null ? const CircularProgressIndicator() : GifWrapper(key: UniqueKey(), image: gif);
                  },
                ),
                Builder(
                  builder: (context) => MaterialButton(
                    child: const Text('Next'),
                    onPressed: () => context.read<RadCubit>().next(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
