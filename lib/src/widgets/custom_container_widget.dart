import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 39, 45, 65),
          width: 8,
        ),
      ),
      padding: const EdgeInsets.all(32),
      child: child,
    );
  }
}
