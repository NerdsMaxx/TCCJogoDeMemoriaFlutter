part of 'code_generator_component.dart';

class _CodeGeneratorComponentLogic {
  _CodeGeneratorComponentLogic(BuildContext context) {
    memoryGameModel = DashboardContext.of(context)!.memoryGameModel!;

    futureCode =
        getIt<GameplayService>().generateGameplay(memoryGameModel.name, memoryGameModel.creator);
  }

  late Future<GameplayModel> futureCode;
  late final MemoryGameModel memoryGameModel;
  final ValueNotifier<bool> reload = ValueNotifier(false);

  VoidCallback onPressedCodeGenerator() => () {
        futureCode = getIt<GameplayService>()
            .generateGameplay(memoryGameModel.name, memoryGameModel.creator);
        reload.value = !reload.value;
      };

  VoidCallback onPressedExit(BuildContext context) => () {
        DashboardContext.of(context)!.hideCodeGenerator();
      };
}
