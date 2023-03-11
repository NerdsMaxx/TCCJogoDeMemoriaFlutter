import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_adding_model.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class CardEditingContext extends InheritedWidget {
  CardEditingContext({
    super.key,
    required this.child,
    required this.showEditableCard,
    required this.cardEditingList,
    this.card,
  }) : super(
          child: child,
        );

  @override
  final Widget child;

  CardEditingModel? card;
  final List<CardEditingModel> cardEditingList;

  final ValueNotifier<bool> showEditableCard;

  @override
  bool updateShouldNotify(CardEditingContext oldWidget) => false;

  static CardEditingContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardEditingContext>();
  }

  CardEditingModel? getCard() => card;

  void setCard(CardEditingModel card) {
    showEditableCard.value = true;
    card = card;
  }

  void clearCard() {
    showEditableCard.value = false;
    card = null;
  }

  void addCardsIfNotExists(CardEditingModel card) {
    if (card is CardAddingModel) {
      CardEditingModel cardEditing = CardEditingModel.fromCardAddingModel(card);

      cardEditingList.addAll([cardEditing, cardEditing.otherCard]);
    }
  }

  List<CardEditingModel> getCardList() => cardEditingList;

  bool isFirstCard() => card is CardAddingModel;
}
