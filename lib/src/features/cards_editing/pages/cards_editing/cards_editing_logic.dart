part of 'cards_editing_page.dart';

class _CardsEditingLogic {
  _CardsEditingLogic(String? memoryGameName) {
    this.memoryGameName = memoryGameName ?? LocalStorage.getString(Keys.MEMORY_GAME_NAME)!;
    futureMemoryGameDto = getIt<MemoryGameService>().getMemoryGame(this.memoryGameName);
  }

  late final String memoryGameName;
  late final Future<MemoryGameDto> futureMemoryGameDto;
  late final MemoryGameEditingModel memoryGameEditingModel;
  final ValueNotifier<bool> showEditableCard = ValueNotifier(false);
  final List<CardEditingModel> cardEditingList = [];
}
