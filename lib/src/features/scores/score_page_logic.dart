part of 'score_page.dart';

class _ScorePageLogic {
  _ScorePageLogic(String? code) {
    this.code = code ?? LocalStorage.getString(Keys.GAMEPLAY_CODE)!;
  }

  final GameplayService gameplayService = getIt<GameplayService>();
  late final String code;
  late Future<GameplayResultModel> futureGameplayResult = gameplayService.getGameplayScores(code);

  VoidCallback onPressedReload(BuildContext context) {
    return () async {
      futureGameplayResult = gameplayService.getGameplayScores(code);
    };
  }

  VoidCallback onPressedBackToDashboard(BuildContext context) {
    return () {
      context.router.push(const DashboardRoute());
    };
  }
}
