import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/colors/colors_palette.dart';

class CreateButtonComp extends StatelessWidget {
  const CreateButtonComp({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsPalette.colorDefault[200],
      ),
      child: const Text(
        'Criar',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
