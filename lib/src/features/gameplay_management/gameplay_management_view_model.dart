part of 'gameplay_management_page.dart';

class GameplayManagementViewModel {
  GameplayManagementViewModel(this.context, bool? currentGameplays) {
    this.currentGameplays = currentGameplays ?? LocalStorage.getBool(Keys.CURRENT_GAMEPLAYS)!;

    if (this.currentGameplays) {
      future = gameplayService.getCodes();
    } else {
      future = gameplayService.getPreviousGameplaysByCreator();
    }
  }

  final BuildContext context;
  late final bool currentGameplays;
  final GameplayService gameplayService = getIt<GameplayService>();
  late Future<Object> future;

  void onPressedReload() {
    future = gameplayService.getCodes();
  }

  void onPressedBackToDashboard() {
    context.router.push(const DashboardRoute());
  }

  VoidCallback onPressedCurrentGameplays(String code) {
    LocalStorage.setInt(
      Keys.SCORE_TYPE_ID,
      ScoreTypeEnum.currentGameplayByCreator.id,
    );

    LocalStorage.setBool(
      Keys.ALONE,
      false,
    );

    return () {
      context.router.push(ScoreRoute(
        code: code,
        scoreType: ScoreTypeEnum.currentGameplayByCreator,
      ));
    };
  }

  VoidCallback onPressedPlayerHistory(int gameplayId) {
    LocalStorage.setInt(
      Keys.SCORE_TYPE_ID,
      ScoreTypeEnum.previousGameplayByCreator.id,
    );

    LocalStorage.setBool(
      Keys.ALONE,
      false,
    );

    return () {
      context.router.push(ScoreRoute(
        gameplayId: gameplayId,
        scoreType: ScoreTypeEnum.previousGameplayByCreator,
      ));
    };
  }
}