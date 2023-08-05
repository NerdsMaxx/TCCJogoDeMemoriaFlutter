import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/enums/score_type_enum.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class TitleViewModel {
  TitleViewModel(this.context) {
    isPlayer = getIt<Auth>().isPlayer();
    isCreator = getIt<Auth>().isCreator();
    dashboardContext = DashboardContext.of(context)!;
  }

  final BuildContext context;
  late final DashboardContext dashboardContext;

  final MemoryGameService memoryGameService = getIt<MemoryGameService>();

  late final bool isPlayer;
  late final bool isCreator;

  void onPressedAdding() {
    context.router.push(const CardAddingRoute());
  }

  void onPressedCodeEntry() {
    dashboardContext.showCodeEntry();
  }

  VoidCallback onPressedGameplayManagement([currentGameplays = false]) {
    LocalStorage.setBool(Keys.CURRENT_GAMEPLAYS, currentGameplays);

    return () {
      context.router.push(GameplayManagementRoute(
        currentGameplays: currentGameplays,
      ));
    };
  }

  void onPressedHistoryGameplay() {
    LocalStorage.setInt(
      Keys.SCORE_TYPE_ID,
      ScoreTypeEnum.previousGameplayByPlayer.id,
    );

    LocalStorage.setBool(
      Keys.ALONE,
      false,
    );

    context.router.push(ScoreRoute(
      alone: false,
      scoreType: ScoreTypeEnum.previousGameplayByPlayer,
    ));
  }

  void onPressedMemoryGamePlayer() {
    dashboardContext.futureMemoryGameList =
        memoryGameService.getAllMemoryGame();
    dashboardContext.changeSearchForPlayer();
    dashboardContext.reloadSearch();
  }

  void onPressedMemoryGameCreator() {
    dashboardContext.futureMemoryGameList =
        memoryGameService.getAllMemoryGame(true);
    dashboardContext.changeSearchForCreator();
    dashboardContext.reloadSearch();
  }
}