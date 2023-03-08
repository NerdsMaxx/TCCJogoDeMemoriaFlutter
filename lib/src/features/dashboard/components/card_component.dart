import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    required this.text,
    required this.onPressedGameplay,
    this.onPressedEditing,
  });

  final String text;
  final VoidCallback onPressedGameplay;
  final VoidCallback? onPressedEditing;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SelectableText(
                text,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: onPressedGameplay,
                    child: const Text('Jogar'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: getIt<Auth>().isCreator(),
                    child: ElevatedButton(
                      onPressed: onPressedEditing,
                      child: const Text('Editar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
