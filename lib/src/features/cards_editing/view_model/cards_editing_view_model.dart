import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class CardsEditingViewModel {
  CardsEditingViewModel(this.context) {
    memoryGameEditingContext = MemoryGameEditingContext.of(context)!;

    cardEditing1 = memoryGameEditingContext.card!;
    cardEditing2 = cardEditing1.otherCard;
  }

  final BuildContext context;
  late final MemoryGameEditingContext memoryGameEditingContext;
  late final CardEditingModel cardEditing1;
  late final CardEditingModel cardEditing2;

  void onPressedApplyChange() {
    memoryGameEditingContext.addCardsIfNotExists(cardEditing1);
    memoryGameEditingContext.clearCard();
  }
}
