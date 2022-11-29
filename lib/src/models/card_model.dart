import 'package:flutter/widgets.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';

class CardModel {
  CardModel({
    this.otherCard,
    this.phrase = '',
    this.isAccepted = false,
    this.isTurned = false,
    required this.typeCard,
  });

  Key id = UniqueKey();
  CardModel? otherCard;
  String phrase;
  bool isAccepted;
  bool isTurned;
  TypeCardEnum typeCard;
}
