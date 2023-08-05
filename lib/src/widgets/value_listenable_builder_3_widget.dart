import 'package:flutter/material.dart';

class ValueListenableBuilder3Widget<T1, T2, T3> extends StatelessWidget {
  const ValueListenableBuilder3Widget({
    super.key,
    required this.valueListenable1,
    required this.valueListenable2,
    required this.valueListenable3,
    required this.builder,
  });

  final ValueNotifier<T1> valueListenable1;
  final ValueNotifier<T2> valueListenable2;
  final ValueNotifier<T3> valueListenable3;
  final Widget Function(BuildContext context, T1 value1, T2 value2, T3 value3)
      builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable1,
      builder: (context, value1, _) => ValueListenableBuilder(
        valueListenable: valueListenable2,
        builder: (context, value2, _) => ValueListenableBuilder(
          valueListenable: valueListenable3,
          builder: (context, value3, _) =>
              builder(context, value1, value2, value3),
        ),
      ),
    );
  }
}