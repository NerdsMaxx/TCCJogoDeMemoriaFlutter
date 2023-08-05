import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/utils/snack_bar_util.dart';
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

    final CustomSnackBarWidget customSnackBarWidget =
        (right) ? CustomSnackBarWidget.forSucess('Ok!') : CustomSnackBarWidget.forError('Errado!');

    SnackBarUtil.showSnackBar(context, customSnackBarWidget);
  }

  void onPressedItsWrong() {
    if (cardGameplay1.isAccepted || cardGameplay2.isAccepted) {
      return;
    }

    bool wrong = memoryGameGameplayContext.itsWrong();

    final CustomSnackBarWidget customSnackBarWidget =
        (wrong) ? CustomSnackBarWidget.forSucess('Ok!') : CustomSnackBarWidget.forError('Errado!');

    SnackBarUtil.showSnackBar(context, customSnackBarWidget);
  }
}
