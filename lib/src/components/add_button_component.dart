import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/widgets/circular_button_widget.dart';

class AddButtonComponent extends StatelessWidget {
  const AddButtonComponent({
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
      icon: Icons.add,
      size: size,
    );
  }
}
