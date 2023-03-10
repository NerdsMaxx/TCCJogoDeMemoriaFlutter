import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';

class CardGameplayContext extends InheritedWidget {
  CardGameplayContext({
    super.key,
    required this.child,
    required this.showGameplayCard,
    required this.cardGameplayList,
    this.card1,
    this.card2,
  }) : super(
          child: child,
        );

  @override
  final Widget child;
  CardGameplayModel? card1;
  CardGameplayModel? card2;
  final List<CardGameplayModel> cardGameplayList;
  final ValueNotifier<bool> showGameplayCard;
  final ValueNotifier<int> score = ValueNotifier(0);

  @override
  bool updateShouldNotify(CardGameplayContext oldWidget) => false;

  static CardGameplayContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardGameplayContext>();
  }

  static CardGameplayModel? getCard1FromContext(BuildContext context) => of(context)?.card1;

  static CardGameplayModel? getCard2FromContext(BuildContext context) => of(context)?.card2;

  static void setCardFromContext(BuildContext context, CardGameplayModel card) {
    if (of(context)?.card1 == null) {
      of(context)?.card1 = card;
      return;
    }

    if (card != of(context)!.card1 && of(context)?.card2 == null) {
      of(context)?.card2 = card;
      of(context)?.showGameplayCard.value = true;
    }
  }

  static void clearCard(BuildContext context) {
    if (of(context)?.card1 != null && of(context)?.card2 != null) {
      of(context)?.card1 = null;
      of(context)?.card2 = null;
      of(context)?.showGameplayCard.value = false;
    }
  }

  static List<CardGameplayModel>? getCardListFromContext(BuildContext context) =>
      of(context)?.cardGameplayList;

  static void itsRight(BuildContext context) {
    bool right = of(context)?.card1 != null &&
        of(context)?.card2 != null &&
        of(context)?.card1!.otherCard == of(context)?.card2!;

    if (right) {
      of(context)?.score.value += 1;
    } else {
      of(context)?.score.value -= 2;
    }

    of(context)?.card1!.accept();
    of(context)?.card2!.accept();

    clearCard(context);
  }

  static void itsWrong(BuildContext context) {
    bool wrong = of(context)?.card1 != null &&
        of(context)?.card2 != null &&
        of(context)?.card1!.otherCard != of(context)?.card2!;

    // if (wrong) {
    //   of(context)?.score.value += 1;
    // } else {
    if (!wrong) {
      of(context)?.score.value -= 2;
    }

    of(context)?.card1!.turnCardOver();
    of(context)?.card2!.turnCardOver();
    clearCard(context);
  }

  static ValueNotifier<int>? getScore(BuildContext context) => of(context)?.score;
}
