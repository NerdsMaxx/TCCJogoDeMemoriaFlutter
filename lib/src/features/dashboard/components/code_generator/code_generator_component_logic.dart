part of 'code_generator_component.dart';

class _CodeGeneratorComponentLogic {
  _CodeGeneratorComponentLogic(BuildContext context) {
    memoryGameDto = DashboardContext.of(context)!.memoryGameDto!;

    futureCode =
        getIt<GameplayService>().generateGameplay(memoryGameDto.name, memoryGameDto.creator);
  }

  late Future<GameplayDto> futureCode;
  late final MemoryGameDto memoryGameDto;
  final ValueNotifier<bool> reload = ValueNotifier(false);

  VoidCallback onPressedCodeGenerator() => () {
        futureCode =
            getIt<GameplayService>().generateGameplay(memoryGameDto.name, memoryGameDto.creator);
        reload.value = !reload.value;
      };

  VoidCallback onPressedExit(BuildContext context) => () {
        DashboardContext.of(context)!.hideCodeGenerator();
      };
}
