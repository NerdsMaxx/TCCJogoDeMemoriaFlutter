import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class MemoryGameEditingModel {
  MemoryGameEditingModel.fromMemoryGameModel(MemoryGameModel memoryGameModel) {
    name = memoryGameModel.name;
    cardList = memoryGameModel.cardList!
        .map((cardModel) => CardEditingModel.fromModel(cardModel))
        .toList();
    cardList.addAll(cardList.map((card) => card.otherCard).toList());
  }

  late final String name;
  late final List<CardEditingModel> cardList;
}
