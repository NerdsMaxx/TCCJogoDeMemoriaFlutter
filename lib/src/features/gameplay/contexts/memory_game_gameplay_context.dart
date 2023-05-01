import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';

class MemoryGameGameplayContext extends InheritedWidget {
  MemoryGameGameplayContext({
    super.key,
    required this.child,
    required this.code,
    required this.isTestingForCreator,
    required this.alone,
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
  final ValueNotifier<bool> finishGameplay = ValueNotifier(false);

  final String? code;
  final bool isTestingForCreator;
  final bool alone;

  final ValueNotifier<bool> updateInformations = ValueNotifier(false);

  int _score = 0;
  int _numberRightOptions = 0;
  int _numberWrongOptions = 0;
  int _numberAttempts = 0;
  int _numberFounds = 0;

  int get score => _score;
  int get numberRightOptions => _numberRightOptions;
  int get numberWrongOptions => _numberWrongOptions;
  int get numberAttempts => _numberAttempts;
  int get numberFounds => _numberFounds;

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
    bool right = card1!.otherCard == card2!;
    ++_numberAttempts;

    if (right) {
      ++_numberRightOptions;

      _score += 50;
      ++_numberFounds;

      card1!.win();
      card2!.win();
    } else {
      ++_numberWrongOptions;

      _score -= 30;

      card1!.turnCardOver();
      card2!.turnCardOver();
    }

    updateInformations.value = !updateInformations.value;
    clearCard();
    verifiyIfFinish();

    return right;
  }

  bool itsWrong() {
    bool wrong = card1!.otherCard != card2!;
    ++_numberAttempts;

    if (wrong) {
      ++_numberRightOptions;
    } else {
      ++_numberWrongOptions;

      _score -= 25;
    }

    card1!.turnCardOver();
    card2!.turnCardOver();

    updateInformations.value = !updateInformations.value;
    clearCard();
    verifiyIfFinish();

    return wrong;
  }

  @override
  bool updateShouldNotify(MemoryGameGameplayContext oldWidget) => false;

  static MemoryGameGameplayContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MemoryGameGameplayContext>();
  }
}
