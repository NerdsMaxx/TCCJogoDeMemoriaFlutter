import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/enums/score_type_enum.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';

class ScoreViewModel {
  ScoreViewModel(this.context, ScoreTypeEnum? scoreType, int? gameplayId,
      String? code, bool? alone) {
    this.code = code ?? LocalStorage.getString(Keys.GAMEPLAY_CODE);
    this.alone = alone ?? LocalStorage.getBool(Keys.ALONE)!;
    this.scoreType = scoreType ??
        ScoreTypeEnum.of(LocalStorage.getInt(Keys.SCORE_TYPE_ID)!)!;
    this.gameplayId = gameplayId ?? LocalStorage.getInt(Keys.GAMEPLAY_ID);

    _getGameplayScoreOrPreviousGameplays();
  }

  final BuildContext context;
  late final ScoreTypeEnum scoreType;
  late final int? gameplayId;
  late final bool alone;

  final GameplayService gameplayService = getIt<GameplayService>();
  late final String? code;
  late Future<Object> futureResult;
  ValueNotifier<bool> reload = ValueNotifier(false);

  VoidCallback onPressedReload(BuildContext context) {
    return () async {
      await _getGameplayScoreOrPreviousGameplays();
      reload.value = !reload.value;
    };
  }

  VoidCallback onPressedBackToDashboard(BuildContext context) {
    return () {
      context.router.push(const DashboardRoute());
    };
  }

  Future<void> _getGameplayScoreOrPreviousGameplays() async {
    if (scoreType == ScoreTypeEnum.previousGameplayByCreator && gameplayId != null) {
      futureResult = gameplayService.getScoresByGameplay(gameplayId!);
      return;
    }

    if (scoreType == ScoreTypeEnum.onePlayerGameplay && gameplayId != null) {
      futureResult =
          gameplayService.getGameplayScoresByPlayerAndGameplay(gameplayId!);
      return;
    }

    if (scoreType == ScoreTypeEnum.previousGameplayByPlayer) {
      futureResult = gameplayService.getPreviousGameplaysByPlayer();
      return;
    }

    if ((scoreType == ScoreTypeEnum.currentGameplayByCreator ||
        scoreType == ScoreTypeEnum.currentGameplayByPlayer) && code != null) {
      futureResult = gameplayService.getGameplayScoresByCode(code!);
      return;
    }

    // throw CustomException.anyError();
  }

  // void dispose() {
  //   LocalStorage.clear(Keys.GAMEPLAY_CODE);
  //   LocalStorage.clear(Keys.ALONE);
  //   LocalStorage.clear(Keys.SCORE_TYPE_ID);
  //   LocalStorage.clear(Keys.GAMEPLAY_ID);
  // }
}