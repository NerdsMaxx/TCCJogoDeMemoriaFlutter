
class ScoreViewModel<T> {
  ScoreViewModel(String? code, this.isPlayer) {
    this.code = code ?? LocalStorage.getString(Keys.GAMEPLAY_CODE);

    if (isPlayer) {
      futureGameplayResult = gameplayService.getPreviousGameplays();
    } else {
      futureGameplayResult = gameplayService.getGameplayScores(code!);
    }
  }

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
