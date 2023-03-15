import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';

class MemoryGameGameplayModel {
  MemoryGameGameplayModel.fromModel(MemoryGameModel memoryGameModel) {
    name = memoryGameModel.name;
    cardList = memoryGameModel.cardList!
        .map((cardModel) => CardGameplayModel.fromModel(cardModel))
        .toList();
    cardList.addAll(cardList.map((card) => card.otherCard).toList());
    cardList.shuffle();
  }

  late final String name;
  late final List<CardGameplayModel> cardList;
}
