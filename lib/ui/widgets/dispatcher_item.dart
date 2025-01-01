import 'package:flutter/cupertino.dart';
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
    return MaterialButton(
      onPressed: () => context.go(path),
      child: SizedBox(
        height: Consts.dispatcherBoxSize,
        width: Consts.dispatcherBoxSize,
        child: Padding(
          padding: EdgeInsets.all(Consts.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              image == null
                  ? const Icon(Icons.question_mark)
                  : Image(
                      image: image,
                      width: Consts.dispatcherIconSize,
                      height: Consts.dispatcherIconSize,
                    ),
              Center(
                child: Text(
                  title,
                  style: Consts.typography,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
