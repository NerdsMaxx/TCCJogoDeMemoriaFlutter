part of 'finish_gameplay_component.dart';

class _FinishGameplayComponentLogic {
  final GameplayService gameplayService = getIt<GameplayService>();

  VoidCallback onPressedFinished(BuildContext context) => () {
        final List<CardGameplayModel> cardGameplayList =
            MemoryGameGameplayContext.of(context)!.cardGameplayList;

        final Set<int> hashCodeSet = {};

        final List<CardScoreModel> cardScoreList = cardGameplayList
            .where((cardGameplay) {
              if (hashCodeSet.contains(cardGameplay.hashCode)) {
                return false;
              }

              hashCodeSet.addAll([cardGameplay.hashCode, cardGameplay.otherCard.hashCode]);
              return true;
            })
            .map(
              (cardGameplay) => CardScoreModel(
                id: cardGameplay.originalId,
                winner: cardGameplay.winner,
              ),
            )
            .toList();

        final PlayerScoreModel playerScore = PlayerScoreModel(
          score: MemoryGameGameplayContext.of(context)!.getScoreValue(),
          cardScoreList: cardScoreList,
        );

        MemoryGameGameplayContext.of(context)!.futureGameplayResult =
            gameplayService.finishGameplay(
          LocalStorage.getString(Keys.GAMEPLAY_CODE)!,
          playerScore,
        );

        MemoryGameGameplayContext.of(context)!.showScores.value = true;
      };
}
