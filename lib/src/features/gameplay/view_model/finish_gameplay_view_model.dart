import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/player_score_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';

class FinishGameplayViewModel {
  FinishGameplayViewModel(this.context) {
    memoryGameGameplayContext = MemoryGameGameplayContext.of(context)!;
  }

  final BuildContext context;
  late final MemoryGameGameplayContext memoryGameGameplayContext;

  final GameplayService gameplayService = getIt<GameplayService>();

  void onPressedFinished() {
    if (memoryGameGameplayContext.isTestingForCreator) {
      context.router.push(
        const DashboardRoute(),
      );

      return;
    }

    final PlayerScoreModel playerScore = PlayerScoreModel(
      score: memoryGameGameplayContext.score,
      numberAttempts: memoryGameGameplayContext.numberAttempts,
      numberRightOptions: memoryGameGameplayContext.numberRightOptions,
      numberWrongOptions: memoryGameGameplayContext.numberWrongOptions,
    );

    final String code =
        memoryGameGameplayContext.code ?? LocalStorage.getString(Keys.GAMEPLAY_CODE)!;

    gameplayService.finishGameplay(
      code,
      playerScore,
    );

    context.router.push(
      ScoreRoute(
        code: code,
        alone: memoryGameGameplayContext.alone,
      ),
    );
  }
}
