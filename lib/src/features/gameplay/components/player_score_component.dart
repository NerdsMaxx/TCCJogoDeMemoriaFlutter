import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';

class PlayerScoreComponent extends StatefulWidget {
  const PlayerScoreComponent({super.key});

  @override
  State<PlayerScoreComponent> createState() => _PlayerScoreComponentState();
}

class _PlayerScoreComponentState extends State<PlayerScoreComponent> {
  late final MemoryGameGameplayContext memoryGameGameplayContext =
      MemoryGameGameplayContext.of(context)!;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: memoryGameGameplayContext.updateInformations,
      builder: (context, _, __) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableText(
            'Pontuação: ${memoryGameGameplayContext.score}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            width: 40,
          ),
          SelectableText(
            'Tentativas: ${memoryGameGameplayContext.numberAttempts}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            width: 40,
          ),
          SelectableText(
            'Encontrados: ${memoryGameGameplayContext.numberFounds}',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
