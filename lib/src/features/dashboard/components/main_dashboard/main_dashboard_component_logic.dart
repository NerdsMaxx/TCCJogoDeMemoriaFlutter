part of 'main_dashboard_component.dart';

class _MainDashboardComponentLogic {
  _MainDashboardComponentLogic() {
    futureMemoryGameModelList = getIt<MemoryGameService>().getAllMemoryGame();
  }

  late final Future<List<MemoryGameModel>> futureMemoryGameModelList;
  late final Future<GameplayModel> futureGameplayModel;
}
