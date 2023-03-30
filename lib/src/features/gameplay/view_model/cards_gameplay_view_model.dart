import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/widgets/custom_snack_bar_widget.dart';

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

    bool right = memoryGameGameplayContext.itsRight();
    
    ScaffoldMessenger.of(context).clearSnackBars();
    if(right) {     
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarWidget.forSucess('Parábens! As cartas estão certas!'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarWidget.forError('Errou! As cartas estão erradas!'));
    }
  }

  void onPressedItsWrong() {
    if (cardGameplay1.isAccepted || cardGameplay2.isAccepted) {
      return;
    }

    bool wrong = MemoryGameGameplayContext.of(context)!.itsWrong();

    ScaffoldMessenger.of(context).clearSnackBars();
    if(wrong) {     
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarWidget.forSucess('Parábens! As cartas estão erradas!'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(CustomSnackBarWidget.forError('Errou! As cartas estão certas!'));
    }
  }
}
