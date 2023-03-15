part of 'save_button_component.dart';

class _SaveButtonComponentLogic {
  final Auth auth = getIt<Auth>();
  final MemoryGameService memoryGameService = getIt<MemoryGameService>();

  VoidCallback onPressedSave(BuildContext context) => () {
        final Set<int> hashCodeSet = {};

        final List<CardModel> cardList = MemoryGameEditingContext.of(context)!
            .cardEditingList
            .where(
              (cardEditing) {
                if (hashCodeSet.contains(cardEditing.hashCode)) {
                  return false;
                }

                hashCodeSet.addAll([cardEditing.hashCode, cardEditing.otherCard.hashCode]);
                return true;
              },
            )
            .map(
              (cardEditing) => CardModel(
                firstContent: cardEditing.content,
                secondContent: cardEditing.otherCard.content,
              ),
            )
            .toList();

        final MemoryGameModel memoryGame = MemoryGameModel(
          name: MemoryGameEditingContext.of(context)!.memoryGameName,
          creator: auth.username!,
          subjectList: MemoryGameEditingContext.of(context)!.subjectList,
          cardList: cardList,
        );

        debugPrint(memoryGame.toJson().toString());

        memoryGameService.saveMemoryGame(memoryGame);
      };
}
