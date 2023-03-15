part of 'gameplay_page.dart';

class _GameplayPageLogic {
  _GameplayPageLogic(String? memoryGameName, String? creatorUsername) {
    this.memoryGameName = memoryGameName ?? LocalStorage.getString(Keys.MEMORY_GAME_NAME)!;
    this.creatorUsername = creatorUsername ?? LocalStorage.getString(Keys.CREATOR_USERNAME)!;

    futureMemoryGameModel =
        getIt<MemoryGameService>().getMemoryGame(this.memoryGameName, this.creatorUsername);
  }

  late final String memoryGameName;
  late final String creatorUsername;
  late final Future<MemoryGameModel> futureMemoryGameModel;
  late final MemoryGameGameplayModel memoryGameGameplayModel;
  final List<CardGameplayModel> cardGameplayList = [];
}
