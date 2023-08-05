import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/enums/score_type_enum.dart';
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

  void onPressedFinished() async {
    if (memoryGameGameplayContext.isTestingForCreator) {
      context.router.push(const DashboardRoute());
      return;
    }

    final PlayerScoreModel playerScore = PlayerScoreModel(
      score: memoryGameGameplayContext.score,
      numberAttempts: memoryGameGameplayContext.numberAttempts,
      numberRightOptions: memoryGameGameplayContext.numberRightOptions,
      numberWrongOptions: memoryGameGameplayContext.numberWrongOptions,
    );

    final String code = memoryGameGameplayContext.code ??
        LocalStorage.getString(Keys.GAMEPLAY_CODE)!;

    final int gameplayId = await gameplayService.finishGameplay(
      code,
      playerScore,
    );

    final bool alone = memoryGameGameplayContext.alone;

    if (!context.mounted) {
      return;
    }

    LocalStorage.setBool(
      Keys.ALONE,
      alone,
    );

    if (alone) {
      LocalStorage.clear(Keys.GAMEPLAY_ID);
    } else {
      LocalStorage.setInt(
        Keys.GAMEPLAY_ID,
        gameplayId,
      );
    }

    LocalStorage.setInt(
      Keys.SCORE_TYPE_ID,
      (alone)
          ? ScoreTypeEnum.onePlayerGameplay.id
          : ScoreTypeEnum.currentGameplayByPlayer.id,
    );

    context.router.push(
      ScoreRoute(
        code: code,
        alone: alone,
        gameplayId: gameplayId,
        scoreType: (alone)
            ? ScoreTypeEnum.onePlayerGameplay
            : ScoreTypeEnum.currentGameplayByPlayer,
      ),
    );
  }
}