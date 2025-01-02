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
          create: (context) => RadCubit(),
          child: BlocBuilder<RadCubit, RadState>(
            builder: (context, state) {
              final gif = state.gif;
              return gif.isEmpty
                  ? Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(Consts.padding),
                        child: Builder(
                          builder: (context) => MaterialButton(
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                              size: Consts.fieldsBoxSize,
                            ),
                            onPressed: () async => context.read<RadCubit>().next(),
                          ),
                        ),
                      ),
                    )
                  : Gif(
                      key: UniqueKey(),
                      images: gif,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      passpartout: true,
                      fit: BoxFit.fitWidth,
                      callback: () => context.read<RadCubit>().hide(),
                    );
            },
          ),
        ),
      ),
    );
  }
}
