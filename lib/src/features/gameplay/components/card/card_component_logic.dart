part of 'card_component.dart';

class _CardComponentLogic {
  _CardComponentLogic(this.card);

  final CardGameplayModel card;

  VoidCallback onPressedCard(BuildContext context) => () {
        card.turnsCard();
        MemoryGameGameplayContext.of(context)!.setCard(card);
      };
}
