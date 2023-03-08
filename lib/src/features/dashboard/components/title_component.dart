import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({
    super.key,
    required this.onPressedAdding,
  });

  final VoidCallback onPressedAdding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SelectableText(
            'Seus jogos de memória',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: onPressedAdding,
            child: Text(
              'Adicionar +1',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ],
    );
  }
}
