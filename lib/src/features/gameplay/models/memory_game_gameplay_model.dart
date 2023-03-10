import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';

class MemoryGameGameplayModel {
  MemoryGameGameplayModel.fromDto(MemoryGameDto memoryGameDto) {
    name = memoryGameDto.name;
    cardList = memoryGameDto.cardDtoList!.map((cardDto) => CardGameplayModel.fromDto(cardDto)).toList();
    cardList.addAll(cardList.map((card) => card.otherCard).toList());
    cardList.shuffle();
  }

  late final String name;
  late final List<CardGameplayModel> cardList;
}
