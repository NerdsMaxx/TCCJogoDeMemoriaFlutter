part of 'gameplay_management_page.dart';

class GameplayManagementViewModel {
  GameplayManagementViewModel(this.context, this.currentGameplays) {
    if (currentGameplays) {
      future = gameplayService.getCodes();
    } else {
      future = gameplayService.getPreviousGameplaysByCreator();
    }
  }

  final BuildContext context;
  final bool currentGameplays;
  final GameplayService gameplayService = getIt<GameplayService>();
  late final Future<Object> future;

  void onPressedReload() {
    future = gameplayService.getCodes();
  }

  void onPressedBackToDashboard() {
    context.router.push(const DashboardRoute());
  }

  VoidCallback onPressedScore(String code) {
    return () {
      context.router.push(ScoreRoute(code: code));
    };
  }

  VoidCallback onPressedPlayerHistory(int gameplayId) {
    return () {
      context.router.push(ScoreRoute(gameplayId: gameplayId));
    };
  }
}
