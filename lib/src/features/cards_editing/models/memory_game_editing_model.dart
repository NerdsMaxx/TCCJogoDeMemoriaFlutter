import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class MemoryGameEditingModel {
  MemoryGameEditingModel.fromMemoryGameModel(MemoryGameModel memoryGame) {
    name = memoryGame.name;

    cardList = memoryGame.cardList!
        .map((cardModel) => CardEditingModel.fromModel(cardModel))
        .toList();
    cardList.addAll(cardList.map((card) => card.otherCard).toList());

    subjectList = memoryGame.subjectList!;
  }

  late final String name;
  late final List<CardEditingModel> cardList;
  late final List<String> subjectList;
}
