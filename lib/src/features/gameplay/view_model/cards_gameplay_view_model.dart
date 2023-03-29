import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';

class CardsGameplayViewModel {
  CardsGameplayViewModel(this.context) {
    memoryGameGameplayContext = MemoryGameGameplayContext.of(context)!;
    cardGameplay1 = memoryGameGameplayContext.card1!;
    cardGameplay2 = memoryGameGameplayContext.card2!;
  }

  final BuildContext context;
  late final MemoryGameGameplayContext memoryGameGameplayContext;
  late final CardGameplayModel cardGameplay1;
  late final CardGameplayModel cardGameplay2;

  void onPressedItsRight() {
    if (cardGameplay1.isAccepted && cardGameplay2.isAccepted) {
      return;
    }

    memoryGameGameplayContext.itsRight();
  }

  void onPressedItsWrong() {
    if (cardGameplay1.isAccepted || cardGameplay2.isAccepted) {
      return;
    }

    MemoryGameGameplayContext.of(context)!.itsWrong();
  }
}
