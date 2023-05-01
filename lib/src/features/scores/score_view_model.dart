import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';

class ScoreViewModel {
  ScoreViewModel(this.context, this.isPlayer, String? code, bool? alone) {
    this.code = code ?? LocalStorage.getString(Keys.GAMEPLAY_CODE);
    this.alone = alone ?? LocalStorage.getBool(Keys.ALONE)!;

    _getGameplayScoreOrPreviousGameplays();
  }

  final BuildContext context;
  final bool isPlayer;
  late final bool alone;

  final GameplayService gameplayService = getIt<GameplayService>();
  late final String? code;
  late Future<Object> futureResult;

  VoidCallback onPressedReload(BuildContext context) {
    return () async {
      await _getGameplayScoreOrPreviousGameplays();
    };
  }

  VoidCallback onPressedBackToDashboard(BuildContext context) {
    return () {
      context.router.push(const DashboardRoute());
    };
  }

  Future<void> _getGameplayScoreOrPreviousGameplays() async {
    if (isPlayer) {
      futureResult = gameplayService.getPreviousGameplaysByPlayer();
    } else {
      futureResult = gameplayService.getGameplayScores(code!);
    }
  }
}
