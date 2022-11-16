import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/models/card.dart';

class CardEditingController extends ValueNotifier<CardModel> {
  CardEditingController(CardModel card) : super(card);
}
