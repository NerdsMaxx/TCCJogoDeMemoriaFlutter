import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/pages/gameplay/gameplay_page.dart';
import 'package:memory_game_web/src/features/gameplay/pages/score/score_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    this.memoryGameName,
    this.creatorUsername,
    this.gameplayCode,
  });

  final String? memoryGameName;
  final String? creatorUsername;
  final String? gameplayCode;

  @override
  Widget build(BuildContext context) {
    return MemoryGameGameplayContext(
      child: Builder(
        builder: (context) => ValueListenableBuilder(
          valueListenable: MemoryGameGameplayContext.of(context)!.showScores,
          builder: (context, showScores, _) {
            if (showScores) {
              return ScorePage(
                code: gameplayCode,
              );
            }

            return GameplayPage(
              memoryGameName: memoryGameName,
              creatorUsername: creatorUsername,
              gameplayCode: gameplayCode,
            );
          },
        ),
      ),
    );
  }
}
