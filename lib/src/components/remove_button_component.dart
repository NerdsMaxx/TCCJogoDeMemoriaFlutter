import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/widgets/circular_button.dart';

class RemoveButtonComp extends StatelessWidget {
  const RemoveButtonComp({
    super.key,
    required this.onPressed,
    this.size,
  });

  final VoidCallback onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      onPressed: onPressed,
      icon: Icons.close,
      size: size,
    );
  }
}
