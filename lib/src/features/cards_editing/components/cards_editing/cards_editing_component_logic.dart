part of 'cards_editing_component.dart';

class _CardsEditingComponentLogic {
  _CardsEditingComponentLogic(BuildContext context) {
    cardEditing1 = MemoryGameEditingContext.of(context)!.card!;
    cardEditing2 = cardEditing1.otherCard;
  }

  late final CardEditingModel cardEditing1;
  late final CardEditingModel cardEditing2;

  VoidCallback onPressedApplyChange(BuildContext context) => () {
        MemoryGameEditingContext.of(context)!.addCardsIfNotExists(cardEditing1);
        MemoryGameEditingContext.of(context)!.clearCard();
      };
}
