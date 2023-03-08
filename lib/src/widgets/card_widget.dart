import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    this.sizeFactor = 1.0,
    required this.child,
  });

  final double sizeFactor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200 * sizeFactor,
      height: 300 * sizeFactor,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          width: 8,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
