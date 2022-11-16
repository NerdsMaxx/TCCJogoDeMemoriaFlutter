import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/colors/colors_palette.dart';

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: ColorsPalette.colorDefault,
        content: SelectableText(
          message,
          style: const TextStyle(
            fontSize: 32,
          ),
        ),
      ),
    );
}
