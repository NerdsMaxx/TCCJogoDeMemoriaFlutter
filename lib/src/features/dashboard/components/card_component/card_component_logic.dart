part of 'card_component.dart';

class _CardComponentLogic {
  _CardComponentLogic(this.memoryGameModel);

  final MemoryGameModel memoryGameModel;
  final GameplayService gameplayService = getIt<GameplayService>();

  VoidCallback onPressedGameplay(BuildContext context) => () async {
        final GameplayModel gameplay = await gameplayService.generateGameplay(memoryGameModel.name);
        final PlayerAddedModel playerAdded = await gameplayService.enterInGameplay(gameplay.code);

        LocalStorage.setString(
          Keys.MEMORY_GAME_NAME,
          memoryGameModel.name,
        );

        LocalStorage.setString(
          Keys.CREATOR_USERNAME,
          memoryGameModel.creator,
        );

        LocalStorage.setString(
          Keys.GAMEPLAY_CODE,
          gameplay.code,
        );

        context.router.push(
          GameplayRoute(
            memoryGameName: memoryGameModel.name,
            creatorUsername: memoryGameModel.creator,
            gameplayCode: gameplay.code,
          ),
        );
      };

  VoidCallback onPressedEditing(BuildContext context) => () {
        LocalStorage.setString(
          Keys.MEMORY_GAME_NAME,
          memoryGameModel.name,
        );

        context.router.push(
          CardsEditingRoute(memoryGameName: memoryGameModel.name),
        );
      };

  VoidCallback onPressedCodeGenerator(BuildContext context) => () {
        DashboardContext.of(context)!.setMemoryGameModel(memoryGameModel);
        DashboardContext.of(context)!.showCodeGenerator();
      };
}
