part of 'search_component.dart';

class _SearchComponentLogic {
  final MemoryGameService memoryGameService = getIt<MemoryGameService>();

  String search = '';

  VoidCallback onPressedSearch(BuildContext context) {
    return () {};
  }

  void Function(String)? onChangedSearch(BuildContext context) {
    return (String value) {
      search = value;
      if (search.isEmpty) {
        DashboardContext.of(context)!.futureMemoryGameList = memoryGameService.getAllMemoryGame();
        DashboardContext.of(context)!.reloadSearch();

        return;
      }

      DashboardContext.of(context)!.futureMemoryGameList =
          memoryGameService.getAllMemoryGameBySearch(search);
      DashboardContext.of(context)!.reloadSearch();
    };
  }
}
