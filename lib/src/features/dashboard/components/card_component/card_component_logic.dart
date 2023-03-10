part of 'card_component.dart';

class _CardComponentLogic {
  const _CardComponentLogic(this.memoryGameDto);

  final MemoryGameDto memoryGameDto;

  VoidCallback onPressedGameplay(BuildContext context) => () {
        LocalStorage.setString(
          Keys.MEMORY_GAME_NAME,
          memoryGameDto.name,
        );

        LocalStorage.setString(
          Keys.CREATOR_USERNAME,
          memoryGameDto.creator,
        );

        context.router.push(
          GameplayRoute(
            memoryGameName: memoryGameDto.name,
            creatorUsername: memoryGameDto.creator,
          ),
        );
      };

  VoidCallback onPressedEditing(BuildContext context) => () {
        LocalStorage.setString(
          Keys.MEMORY_GAME_NAME,
          memoryGameDto.name,
        );

        context.router.push(
          CardsEditingRoute(memoryGameName: memoryGameDto.name),
        );
      };

  VoidCallback onPressedCodeGenerator(BuildContext context) => () {
        DashboardContext.of(context)!.setMemoryGameDto(memoryGameDto);
        DashboardContext.of(context)!.showCodeGenerator();
      };
}
