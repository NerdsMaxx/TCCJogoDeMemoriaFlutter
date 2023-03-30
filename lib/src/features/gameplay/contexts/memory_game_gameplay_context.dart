import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/models/gameplay_result_model.dart';
import 'package:memory_game_web/src/models/player_result_model.dart';

class MemoryGameGameplayContext extends InheritedWidget {
  MemoryGameGameplayContext({
    super.key,
    required this.child,
    this.code,
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

  final ValueNotifier<bool> finishGameplay = ValueNotifier(false);

  // late Future<GameplayResultModel> futureGameplayResult;

  // final ValueNotifier<bool> showScores = ValueNotifier(false);

  final String? code;

  @override
  bool updateShouldNotify(MemoryGameGameplayContext oldWidget) => false;

  static MemoryGameGameplayContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MemoryGameGameplayContext>();
  }

  CardGameplayModel? getCard1() => card1;

  CardGameplayModel? getCard2() => card2;

  ValueNotifier<int> getScore() => score;

  int getScoreValue() => score.value;

  List<CardGameplayModel> getCardList() => cardGameplayList;

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

  void verifiyIfFinish() {
    if (cardGameplayList.where((card) => card.isAccepted).length == cardGameplayList.length) {
      finishGameplay.value = true;
    }
  }

  bool itsRight() {
    bool right = card1 != null && card2 != null && card1!.otherCard == card2!;

    if (right) {
      score.value += 1;
      card1!.win();
      card2!.win();
    } else {
      score.value -= 1;
      card1!.turnCardOver();
      card2!.turnCardOver();
    }

    clearCard();
    verifiyIfFinish();

    return right;
  }

  bool itsWrong() {
    bool wrong = card1 != null && card2 != null && card1!.otherCard != card2!;

    if (!wrong) {
      score.value -= 1;
    }

    card1!.turnCardOver();
    card2!.turnCardOver();

    clearCard();
    verifiyIfFinish();

    return wrong;
  }
}
