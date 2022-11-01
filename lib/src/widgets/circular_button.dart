import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.size,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff342f27),
        shape: const CircleBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
          size: size,
        ),
      ),
    );
  }
}
