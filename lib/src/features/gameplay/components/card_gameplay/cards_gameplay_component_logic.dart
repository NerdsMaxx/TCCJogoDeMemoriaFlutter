part of 'cards_gameplay_component.dart';

class _CardsGameplayComponentLogic {
  _CardsGameplayComponentLogic(BuildContext context) {
    cardGameplay1 = MemoryGameGameplayContext.of(context)!.card1!;
    cardGameplay2 = MemoryGameGameplayContext.of(context)!.card2!;
  }

  late final CardGameplayModel cardGameplay1;
  late final CardGameplayModel cardGameplay2;

  onPressedItsRight(BuildContext context) => () {
        if (cardGameplay1.isAccepted && cardGameplay2.isAccepted) {
          return;
        }

        MemoryGameGameplayContext.of(context)!.itsRight();
      };

  onPressedItsWrong(BuildContext context) => () {
        if (cardGameplay1.isAccepted || cardGameplay2.isAccepted) {
          return;
        }

        MemoryGameGameplayContext.of(context)!.itsWrong();
      };
}
