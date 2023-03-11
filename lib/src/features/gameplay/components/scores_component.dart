import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/card_gameplay_context.dart';

class ScoresComponent extends StatefulWidget {
  const ScoresComponent({super.key});

  @override
  State<ScoresComponent> createState() => _ScoresComponentState();
}

class _ScoresComponentState extends State<ScoresComponent> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CardGameplayContext.of(context)!.getScore(),
      builder: (context, value, _) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableText(
            'Pontuação: $value',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
