import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class DragRadScreen extends StatelessWidget {
  const DragRadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _DragWidget(text: 'TEXT 1 (flex 1)', color: Colors.red, flex: 1),
            _DragWidget(text: 'TEXT 2 (flex 2)', color: Colors.blue, flex: 2),
          ],
        ),
        Row(
          children: [
            _DragWidget(text: 'TEXT 3 (flex 1)', color: Colors.orange, flex: 1),
          ],
        ),
        Row(
          children: [
            _DragWidget(text: 'TEXT 4 (flex 1)', color: Colors.purple, flex: 1),
            _DragWidget(text: 'TEXT 5 (flex 1)', color: Colors.grey, flex: 1),
            _DragWidget(text: 'TEXT 6 (flex 1)', color: Colors.amber, flex: 1),
          ],
        ),
        Row(
          children: [
            _DragWidget(text: 'TEXT 7 (flex 3)', color: Colors.white, flex: 3),
          ],
        ),
      ],
    );
  }
}

class _DragWidget extends StatelessWidget {
  _DragWidget({
    required String text,
    required Color color,
    int flex = 1,
  }) : holder = _ValueHolder(text: text, color: color, flex: flex);

  final _ValueHolder holder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<_DragWidgetCubit>(
      create: (_) => _DragWidgetCubit(),
      child: BlocBuilder<_DragWidgetCubit, int>(
        builder: (context, _) {
          final cubit = context.read<_DragWidgetCubit>();
          holder.callback = () => cubit.bump();
          return Expanded(
            flex: holder.flex,
            child: LongPressDraggable(
              data: holder,
              feedback: Container(
                width: 100,
                height: 100,
                color: holder.color.brighten(factor: 0.5),
                child: Text(holder.text),
              ),
              child: DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: candidateData.isNotEmpty ? holder.color.darken(factor: 0.2) : holder.color,
                    child: Text(holder.text),
                  );
                },
                onAcceptWithDetails: (drag) {
                  final data = drag.data;
                  if (data is _ValueHolder) {
                    final copy = _ValueHolder(text: data.text, color: data.color, flex: data.flex);
                    data.color = holder.color;
                    data.text = holder.text;
                    data.flex = holder.flex;
                    holder.color = copy.color;
                    holder.text = copy.text;
                    holder.flex = copy.flex;
                    final callback = data.callback;
                    if (callback != null) {
                      callback();
                    }
                  }
                },
              ),
              onDragEnd: (_) {},
            ),
          );
        },
      ),
    );
  }
}

class _ValueHolder {
  _ValueHolder({
    required this.text,
    required this.color,
    this.flex = 1,
  });

  String text;

  Color color;

  int flex;

  Function()? callback;
}

class _DragWidgetCubit extends Cubit<int> {
  _DragWidgetCubit() : super(0);

  void bump() => emit(state + 1);
}
