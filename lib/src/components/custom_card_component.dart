import 'package:flutter/material.dart';

class CustomCardComponent extends StatelessWidget {
  const CustomCardComponent({
    super.key,
    required this.child,
    this.sizeFactor = 1,
  });

  final Widget child;
  final double sizeFactor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200 * sizeFactor,
      height: 300 * sizeFactor,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: const Color(0xff342f27),
          width: 8,
        ),
      ),
      child: child,
    );
  }
}
