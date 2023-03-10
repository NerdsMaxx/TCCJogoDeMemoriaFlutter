import 'package:flutter/material.dart';

class ValueListenableBuilder2Widget<T1, T2> extends StatelessWidget {
  const ValueListenableBuilder2Widget({
    super.key,
    required this.valueListenable1,
    required this.valueListenable2,
    required this.builder,
  });

  final ValueNotifier<T1> valueListenable1;
  final ValueNotifier<T2> valueListenable2;
  final Widget Function(BuildContext context, T1 value1, T2 value2) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable1,
      builder: (context, value1, _) => ValueListenableBuilder(
        valueListenable: valueListenable2,
        builder: (context, value2, _) => builder(context, value1, value2),
      ),
    );
  }
}
