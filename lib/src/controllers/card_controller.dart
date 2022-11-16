import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

class CardEditingController extends ValueNotifier<CardModel> {
  CardEditingController(CardModel card) : super(card);
}
