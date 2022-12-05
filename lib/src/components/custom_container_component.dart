import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/colors/colors_palette.dart';

class CustomContainerComponent extends StatelessWidget {
  const CustomContainerComponent({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: ColorsPalette.colorDefault.shade400,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: ColorsPalette.colorDefault,
              width: 10.0,
            )),
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
