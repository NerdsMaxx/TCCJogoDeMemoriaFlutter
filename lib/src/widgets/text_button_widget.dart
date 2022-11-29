import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/colors/colors_palette.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsPalette.colorDefault[200],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }
}
