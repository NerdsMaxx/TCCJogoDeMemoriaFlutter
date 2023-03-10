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
  final ValueNotifier<bool> newChanges = ValueNotifier(false);

  @override
  bool updateShouldNotify(CardEditingContext oldWidget) => false;

  static CardEditingContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CardEditingContext>();
  }

  static CardEditingModel? getCardFromContext(BuildContext context) => of(context)?.card;

  static void setCardFromContext(BuildContext context, CardEditingModel card) {
    of(context)?.showEditableCard.value = true;
    of(context)?.card = card;
  }

  static void clearCard(BuildContext context) {
    of(context)?.showEditableCard.value = false;
    of(context)?.card = null;
  }

  static void addCardsIfNotExistsFromContext(BuildContext context, CardEditingModel card) {
    if (card is CardAddingModel) {
      CardEditingModel cardEditing = CardEditingModel.fromCardAddingModel(card);

      of(context)?.cardEditingList.addAll([cardEditing, cardEditing.otherCard]);
      of(context)?.newChanges.value = of(context)?.newChanges.value ?? false;
    }
  }

  static List<CardEditingModel>? getCardListFromContext(BuildContext context) =>
      of(context)?.cardEditingList;

  static bool isFirstCard(BuildContext context) => of(context)?.card is CardAddingModel;
}
