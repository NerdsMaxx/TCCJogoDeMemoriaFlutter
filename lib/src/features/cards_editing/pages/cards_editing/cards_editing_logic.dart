part of 'cards_editing_page.dart';

class _CardsEditingLogic {
  _CardsEditingLogic(String? memoryGameName) {
    this.memoryGameName = memoryGameName ?? LocalStorage.getString(Keys.MEMORY_GAME_NAME)!;
    futureMemoryGameModel = getIt<MemoryGameService>().getMemoryGame(this.memoryGameName);
  }

  late final String memoryGameName;
  late final Future<MemoryGameModel> futureMemoryGameModel;
  late final MemoryGameEditingModel memoryGameEditingModel;
}
