import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';

class PlayerScoreComponent extends StatefulWidget {
  const PlayerScoreComponent({super.key});

  @override
  State<PlayerScoreComponent> createState() => _PlayerScoreComponentState();
}

class _PlayerScoreComponentState extends State<PlayerScoreComponent> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MemoryGameGameplayContext.of(context)!.getScore(),
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
