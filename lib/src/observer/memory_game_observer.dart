import 'package:flutter/foundation.dart';

import '../models/card_gameplay_model.dart';

class MemoryGameObserver extends ValueNotifier<List<CardGameplayModel>> {
  MemoryGameObserver() : super([]);

  void turnCard(CardGameplayModel card) {
    final cardTurned = value.firstWhere((card1) => card1.id == card.id);
    cardTurned.changeTurned();
    notifyListeners();
  }

  bool winOrLose(CardGameplayModel card1, CardGameplayModel card2) {
    if (!card1.isTurned || !card2.isTurned) {
      throw Exception('As cartas deviam estar viradas!');
    }

    if (card1.id == card2.otherCard?.id) {
      card1.accept();
      card2.accept();
      notifyListeners();
      return true;
    }

    card1.turnCardOver();
    card2.turnCardOver();
    notifyListeners();
    return false;
  }
}
