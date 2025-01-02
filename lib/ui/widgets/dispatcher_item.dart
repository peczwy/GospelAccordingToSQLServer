import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class DispatcherItem extends StatelessWidget {
  const DispatcherItem({
    super.key,
    required this.path,
    required this.title,
    this.image,
  });

  final String path;
  final String title;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    final image = this.image;
    return BlocProvider<_DispatcherCubit>(
      create: (_) => _DispatcherCubit(),
      child: Builder(
        builder: (context) => MouseRegion(
          onEnter: (_) => context.read<_DispatcherCubit>().setHoover(true),
          onExit: (_) => context.read<_DispatcherCubit>().setHoover(false),
          child: MaterialButton(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => context.go(path),
            child: SizedBox(
              height: Consts.dispatcherBoxSize,
              width: Consts.dispatcherBoxSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  image == null
                      ? const Icon(Icons.question_mark)
                      : Image(
                          image: image,
                          width: Consts.dispatcherIconSize,
                          height: Consts.dispatcherIconSize,
                        ),
                  BlocBuilder<_DispatcherCubit, bool>(
                    builder: (_, state) => AnimatedOpacity(
                      opacity: state ? 1 : 0,
                      duration: Consts.quick,
                      child: SizedBox(
                        height: Consts.dispatcherIconSize,
                        width: Consts.dispatcherIconSize,
                        child: Center(
                          child: Text(
                            title,
                            style: Consts.typographyDispatcher,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DispatcherCubit extends Cubit<bool> {
  _DispatcherCubit() : super(false);

  void setHoover(bool hovered) => emit(hovered);
}
