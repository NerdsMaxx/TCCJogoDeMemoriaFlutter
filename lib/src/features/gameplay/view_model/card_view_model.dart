import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';

class CardViewModel {
  CardViewModel(this.context, this.card) {
    memoryGameGameplayContext = MemoryGameGameplayContext.of(context)!;
  }

  final BuildContext context;
  final CardGameplayModel card;
  late final MemoryGameGameplayContext memoryGameGameplayContext;

  void onPressedCard() {
    if(! card.isAccepted) {
      card.turnsCard();
      memoryGameGameplayContext.setCard(card);
    }
  }
}