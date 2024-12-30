import 'package:flutter/material.dart';
import 'package:gospel_at_flutter/gospel_at_flutter.dart';

class TestScreen extends StatelessWidget {
  const TestScreen();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 84, 255, 13),
      child: BlocProvider<TestCubit>(
        create: (context) => TestCubit(0),
        child: Column(
          children: [
            BlocBuilder<TestCubit, int>(
              builder: (context, state) => SelectableText('Hi ${state}'),
            ),
            Builder(
              builder: (context) => MaterialButton(
                onPressed: () => context.read<TestCubit>().inc(),
                child: Text('Press me'),
              ),
            ),
            Builder(
              builder: (context) => MaterialButton(
                // onPressed: () => context.go('/bump'),
                onPressed: () => context.go('/bump/abb'),
                child: Text('Press me 2'),
              ),
            ),
            BlocBuilder<TestCubit, int>(
              builder: (context, state) => AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: (state + 1) % 2,
                duration: const Duration(milliseconds: 2000),
                // The green box must be a child of the AnimatedOpacity widget.
                child: Container(
                  child: Image.asset(
                    'images/eye_2.png',
                    width: 376,
                    height: 539,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestCubit extends Cubit<int> {
  TestCubit(super.initialState);

  void inc() {
    emit(state + 1);
  }
}
