import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/widgets/circular_button_widget.dart';

class RemoveButtonComponent extends StatelessWidget {
  const RemoveButtonComponent({
    super.key,
    required this.onPressed,
    this.size,
  });

  final VoidCallback onPressed;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CircularButtonWidget(
      onPressed: onPressed,
      icon: Icons.close,
      size: size,
    );
  }
}
