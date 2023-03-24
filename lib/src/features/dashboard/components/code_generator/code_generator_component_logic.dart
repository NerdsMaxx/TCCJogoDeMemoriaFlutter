part of 'code_generator_component.dart';

class _CodeGeneratorComponentLogic {
  _CodeGeneratorComponentLogic(BuildContext context) {
    memoryGame = DashboardContext.of(context)!.memoryGameModel!;

    futureCode = getIt<GameplayService>()
        .generateGameplay(GameplayModel(memoryGame: memoryGame.name, creator: memoryGame.creator));
  }

  late Future<GameplayModel> futureCode;
  late final MemoryGameModel memoryGame;
  final ValueNotifier<bool> reload = ValueNotifier(false);

  VoidCallback onPressedCodeGenerator() {
    return () {
      futureCode = getIt<GameplayService>().generateGameplay(
          GameplayModel(memoryGame: memoryGame.name, creator: memoryGame.creator));
      reload.value = !reload.value;
    };
  }

  VoidCallback onPressedExit(BuildContext context) {
    return () {
      DashboardContext.of(context)!.hideCodeGenerator();
    };
  }
}
