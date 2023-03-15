import 'package:flutter/material.dart';
import 'package:memory_game_web/src/models/card_model.dart';
import 'package:uuid/uuid.dart';

class CardGameplayModel {
  final id = const Uuid().v4();
  late final int? originalId;
  late final String content;
  late final CardGameplayModel otherCard;
  bool isAccepted = false;
  ValueNotifier<bool> isTurned = ValueNotifier(false);

  CardGameplayModel();

  CardGameplayModel.fromModel(CardModel cardModel) {
    originalId = cardModel.id;
    content = cardModel.firstContent;
    otherCard = CardGameplayModel();
    otherCard.originalId = cardModel.id;
    otherCard.content = cardModel.secondContent;
    otherCard.otherCard = this;
  }

  void turnsCard() => isTurned.value = true;

  void turnCardOver() {
    if (isAccepted) {
      return;
    }

    isTurned.value = false;
  }

  void accept() {
    isAccepted = true;
    isTurned.value = true;
  }
}
