import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';

class ScoreViewModel {
  ScoreViewModel(this.context, this.isPlayer, String? code) {
    this.code = code ?? LocalStorage.getString(Keys.GAMEPLAY_CODE);

    if (isPlayer) {
      futureGameplayResult = gameplayService.getPreviousGameplays();
    } else {
      futureGameplayResult = gameplayService.getGameplayScores(code!);
    }
  }

  final BuildContext context;
  final bool isPlayer;

  final GameplayService gameplayService = getIt<GameplayService>();
  late final String? code;
  late Future<Object> futureGameplayResult;

  VoidCallback onPressedReload(BuildContext context) {
    return () async {
      futureGameplayResult = gameplayService.getGameplayScores(code!);
    };
  }

  VoidCallback onPressedBackToDashboard(BuildContext context) {
    return () {
      context.router.push(const DashboardRoute());
    };
  }
}
