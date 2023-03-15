import 'package:memory_game_web/src/models/card_model.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_adding_model.dart';
import 'package:uuid/uuid.dart';

class CardEditingModel {
  final id = const Uuid().v4();
  late String content;
  late final CardEditingModel otherCard;

  CardEditingModel();

  CardEditingModel.fromModel(CardModel cardModel) {
    content = cardModel.firstContent;
    otherCard = CardEditingModel();
    otherCard.content = cardModel.secondContent;
    otherCard.otherCard = this;
  }

  CardEditingModel.fromCardAddingModel(CardAddingModel cardAdding) {
    content = cardAdding.content;
    otherCard = CardEditingModel();
    otherCard.content = cardAdding.otherCard.content;
    otherCard.otherCard = this;
  }
}
