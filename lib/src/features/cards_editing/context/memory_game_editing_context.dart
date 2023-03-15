import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_adding_model.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class MemoryGameEditingContext extends InheritedWidget {
  MemoryGameEditingContext({
    super.key,
    required this.child,
    this.card,
  }) : super(
          child: child,
        );

  @override
  final Widget child;
  
  String memoryGameName = '';
  List<String> subjectList = [];
  
  CardEditingModel? card;
  final List<CardEditingModel> cardEditingList = [];

  final ValueNotifier<bool> showEditableCard = ValueNotifier(false);

  @override
  bool updateShouldNotify(MemoryGameEditingContext oldWidget) => false;

  static MemoryGameEditingContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MemoryGameEditingContext>();
  }

  CardEditingModel? getCard() => card;

  void setCard(CardEditingModel cardEditing) {
    card = cardEditing;
    showEditableCard.value = true;
  }

  void clearCard() {
    card = null;
    showEditableCard.value = false;
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
