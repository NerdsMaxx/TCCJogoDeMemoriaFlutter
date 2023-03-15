part of 'card_component.dart';

class _CardComponentLogic {
  const _CardComponentLogic(this.memoryGameModel);

  final MemoryGameModel memoryGameModel;

  VoidCallback onPressedGameplay(BuildContext context) => () {
        LocalStorage.setString(
          Keys.MEMORY_GAME_NAME,
          memoryGameModel.name,
        );

        LocalStorage.setString(
          Keys.CREATOR_USERNAME,
          memoryGameModel.creator,
        );

        context.router.push(
          GameplayRoute(
            memoryGameName: memoryGameModel.name,
            creatorUsername: memoryGameModel.creator,
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
