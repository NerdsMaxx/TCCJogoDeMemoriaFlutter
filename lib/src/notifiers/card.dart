import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/models/card.dart';

class CardNotifier extends ValueNotifier<CardModel> {
  CardNotifier(CardModel card) : super(card);

  CardModel get card => value;

  set card(CardModel otherCard) => value = otherCard;
}
