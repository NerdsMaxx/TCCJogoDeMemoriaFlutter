import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_adding_model.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class MemoryGameEditingContext extends InheritedWidget {
  MemoryGameEditingContext({
    super.key,
    required this.child,
    required this.isNew,
    this.card,
  }) : super(
          child: child,
        );

  @override
  final Widget child;

  late final String? oldMemoryGameName;
  String memoryGameName = '';
  List<String> subjectList = [];

  CardEditingModel? card;
  final List<CardEditingModel> cardEditingList = [];

  final ValueNotifier<bool> showEditableCard = ValueNotifier(false);
  final ValueNotifier<bool> showSavedMemoryGame = ValueNotifier(false);

  final bool isNew;

  @override
  bool updateShouldNotify(MemoryGameEditingContext oldWidget) => false;

  static MemoryGameEditingContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MemoryGameEditingContext>();
  }

  CardEditingModel? getCard() => card;

  List<CardEditingModel> getCardList() => cardEditingList;

  bool isFirstCard() => card is CardAddingModel;

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


}
