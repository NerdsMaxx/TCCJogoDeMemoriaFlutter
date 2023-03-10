part of 'main_dashboard_component.dart';

class _MainDashboardComponentLogic {
  _MainDashboardComponentLogic() {
    futureMemoryGameDtoList = getIt<MemoryGameService>().getAllMemoryGame();
  }

  late final Future<List<MemoryGameDto>> futureMemoryGameDtoList;
  late final Future<GameplayDto> futureGameplayDto;
}
