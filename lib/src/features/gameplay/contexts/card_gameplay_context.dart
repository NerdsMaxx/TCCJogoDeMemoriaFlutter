import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';

class CardGameplayContext extends InheritedWidget {
  CardGameplayContext({
    super.key,
    required this.child,
    this.card1,
    this.card2,
  }) : super(
          child: child,
        );


  @override
  final Widget child;

  CardGameplayModel? card1;
  CardGameplayModel? card2;

  final List<CardGameplayModel> cardGameplayList = [];

  final ValueNotifier<bool> showGameplayCard = ValueNotifier(false);
  final ValueNotifier<int> score = ValueNotifier(0);

  @override
  bool updateShouldNotify(CardGameplayContext oldWidget) => false;

  static CardGameplayContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardGameplayContext>();
  }

  CardGameplayModel? getCard1() => card1;

  CardGameplayModel? getCard2() => card2;

  void setCard(CardGameplayModel card) {
    if (card1 == null) {
      card1 = card;
      return;
    }

    if (card != card1 && card2 == null) {
      card2 = card;
      showGameplayCard.value = true;
    }
  }

  void clearCard() {
    if (card1 != null && card2 != null) {
      card1 = null;
      card2 = null;
      showGameplayCard.value = false;
    }
  }

  List<CardGameplayModel> getCardList() => cardGameplayList;

  void itsRight() {
    bool right = card1 != null &&
        card2 != null &&
        card1!.otherCard == card2!;

    if (right) {
      score.value += 1;
    } else {
      score.value -= 2;
    }

    card1!.accept();
    card2!.accept();

    clearCard();
  }

  void itsWrong() {
    bool wrong = card1 != null &&
        card2 != null &&
        card1!.otherCard != card2!;

    // if (wrong) {
    //   of(context)?.score.value += 1;
    // } else {
    if (!wrong) {
      score.value -= 2;
    }

    card1!.turnCardOver();
    card2!.turnCardOver();
    clearCard();
  }

  ValueNotifier<int> getScore() => score;
}
