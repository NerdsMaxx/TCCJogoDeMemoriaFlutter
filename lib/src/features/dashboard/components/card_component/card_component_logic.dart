part of 'card_component.dart';

class _CardComponentLogic {
  _CardComponentLogic(this.memoryGame);

  final MemoryGameModel memoryGame;
  final GameplayService gameplayService = getIt<GameplayService>();

  VoidCallback onPressedGameplay(BuildContext context) => () async {
        final GameplayModel gameplay = await gameplayService
            .generateGameplay(GameplayModel(memoryGame: memoryGame.name, alone: true));
        final PlayerAddedModel playerAdded = await gameplayService.enterInGameplay(gameplay.code!);

        LocalStorage.setString(
          Keys.MEMORY_GAME_NAME,
          playerAdded.memoryGame.name,
        );

        LocalStorage.setString(
          Keys.CREATOR_USERNAME,
          playerAdded.memoryGame.creator,
        );

        LocalStorage.setString(
          Keys.GAMEPLAY_CODE,
          gameplay.code!,
        );

        if (context.mounted) {
          context.router.push(
            GameplayRoute(
              memoryGameName: memoryGame.name,
              creatorUsername: memoryGame.creator,
              gameplayCode: gameplay.code,
            ),
          );
        }
      };

  VoidCallback onPressedEditing(BuildContext context) => () {
        LocalStorage.setString(
          Keys.MEMORY_GAME_NAME,
          memoryGame.name,
        );

        context.router.push(
          CardsEditingRoute(memoryGameName: memoryGame.name),
        );
      };

  VoidCallback onPressedCodeGenerator(BuildContext context) => () {
        DashboardContext.of(context)!.setMemoryGame(memoryGame);
        DashboardContext.of(context)!.showCodeGenerator();
      };
}
