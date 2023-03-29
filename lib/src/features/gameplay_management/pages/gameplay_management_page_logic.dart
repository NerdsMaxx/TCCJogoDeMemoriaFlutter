part of 'gameplay_management_page.dart';

class _GameplayManagementPageLogic {
  _GameplayManagementPageLogic() {
    futureCodes = gameplayService.getCodes();
  }

  final GameplayService gameplayService = getIt<GameplayService>();
  late final Future<CodesModel> futureCodes;

  void onPressedReload() {
    futureCodes = gameplayService.getCodes();
  }

  VoidCallback onPressedBackToDashboard(BuildContext context) {
    return () {
      context.router.push(const DashboardRoute());
    };
  }

  VoidCallback onPressedScore(BuildContext context, String code) {
    return () {
      context.router.push(ScoreRoute<GameplayResultModel>(code: code));
    };
  }
}
