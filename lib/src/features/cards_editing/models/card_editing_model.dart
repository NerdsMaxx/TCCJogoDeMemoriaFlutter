import 'package:memory_game_web/src/dtos/card_dto.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_adding_model.dart';
import 'package:uuid/uuid.dart';

class CardEditingModel {
  final id = const Uuid().v4();
  late String content;
  late final CardEditingModel otherCard;

  CardEditingModel();

  CardEditingModel.fromDto(CardDto cardDto) {
    content = cardDto.firstContent;
    otherCard = CardEditingModel();
    otherCard.content = cardDto.secondContent;
    otherCard.otherCard = this;
  }

  CardEditingModel.fromCardAddingModel(CardAddingModel cardAdding) {
    content = cardAdding.content;
    otherCard = CardEditingModel();
    otherCard.content = cardAdding.otherCard.content;
    otherCard.otherCard = this;
  }
}
