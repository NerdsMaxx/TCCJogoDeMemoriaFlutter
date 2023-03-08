

import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class MemoryGameEditingModel {
  MemoryGameEditingModel.fromDto(MemoryGameDto memoryGameDto) {
    name = memoryGameDto.name;
    cardList = memoryGameDto.cardDtoList!.map((dto) => CardEditingModel.fromDto(dto)).toList();
    cardList.addAll(cardList.map((card) => card.otherCard).toList());
  }

  late final String name;
  late final List<CardEditingModel> cardList;
}
