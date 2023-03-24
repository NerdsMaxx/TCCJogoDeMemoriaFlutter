part of 'main_dashboard_component.dart';

class _MainDashboardComponentLogic {
  _MainDashboardComponentLogic(BuildContext context) {
    DashboardContext.of(context)!.futureMemoryGameList = memoryGameService.getAllMemoryGame();
  }

  final MemoryGameService memoryGameService = getIt<MemoryGameService>();
  late final Future<GameplayModel> futureGameplayModel;
}
