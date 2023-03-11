part of 'cards_editing_component.dart';

class _CardsEditingComponentLogic {
  _CardsEditingComponentLogic(BuildContext context) {
    cardEditing1 = CardEditingContext.of(context)!.card!;
    cardEditing2 = cardEditing1.otherCard;
  }

  late final CardEditingModel cardEditing1;
  late final CardEditingModel cardEditing2;

  VoidCallback onPressedApplyChange(BuildContext context) => () {
        CardEditingContext.of(context)!.addCardsIfNotExists(cardEditing1);
        CardEditingContext.of(context)!.clearCard();
      };
}
