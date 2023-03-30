part of 'gameplay_management_page.dart';

class GameplayManagementViewModel {
  GameplayManagementViewModel(this.context) {
    futureCodes = gameplayService.getCodes();
  }

  final BuildContext context;

  final GameplayService gameplayService = getIt<GameplayService>();
  late final Future<CodesModel> futureCodes;

  void onPressedReload() {
    futureCodes = gameplayService.getCodes();
  }

  void onPressedBackToDashboard() {
    context.router.push(const DashboardRoute());
  }

  VoidCallback onPressedScore(String code) {
    return () {
      context.router.push(ScoreRoute(code: code));
    };
  }
}
