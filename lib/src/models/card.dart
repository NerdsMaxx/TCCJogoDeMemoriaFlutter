import 'package:flutter/widgets.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';

class CardModel {
  CardModel({
    this.otherCard,
    this.phrase = '',
    this.isActive = true,
    this.inCreationMode = false,
    required this.typeCard,
  });

  CardModel._withId({
    required this.id,
    required this.otherCard,
    required this.phrase,
    required this.isActive,
    required this.inCreationMode,
    required this.typeCard,
  });

  CardModel.empty()
      : otherCard = null,
        phrase = '',
        isActive = false,
        inCreationMode = false,
        typeCard = TypeCard.answer;

  Key id = UniqueKey();
  CardModel? otherCard;
  String phrase;
  bool isActive;
  bool inCreationMode;
  TypeCard typeCard;

  factory CardModel.from(CardModel card) => CardModel._withId(
        id: card.id,
        otherCard: card.otherCard,
        phrase: card.phrase,
        isActive: card.isActive,
        inCreationMode: card.inCreationMode,
        typeCard: card.typeCard,
      );
}
