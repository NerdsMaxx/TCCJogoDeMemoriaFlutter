import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/widgets/text_button_widget.dart';

class EditButtonComponent extends StatelessWidget {
  const EditButtonComponent({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButtonWidget(
      onPressed: onPressed,
      text: 'Editar',
    );
  }
}
