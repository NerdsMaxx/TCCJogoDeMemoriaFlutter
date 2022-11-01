import 'package:jogo_de_memoria_flutter/src/models/card.dart';

class GenerateCard {
  static int _id = 1;

  static CardModel execute() => CardModel(id: _id++);
}