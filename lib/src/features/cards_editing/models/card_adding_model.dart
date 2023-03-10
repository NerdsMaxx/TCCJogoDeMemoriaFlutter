import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class CardAddingModel extends CardEditingModel {
  CardAddingModel() {
    content = '';
    otherCard = CardAddingModel._otherCard();
    otherCard.otherCard = this;
  }

  CardAddingModel._otherCard() {
    content = '';
  }
}
