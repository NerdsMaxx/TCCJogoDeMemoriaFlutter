part of 'code_entry_component.dart';

class _CodeEntryComponentLogic {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final validatorCode = ValidationBuilder(requiredMessage: 'Deve ter 4 dígitos!')
      .minLength(4, 'Deve ter 4 dígitos.')
      .build();

  String code = '';
  String label = '';

  Future<PlayerAddedDto>? futurePlayerAddedDto;
  ValueNotifier<bool> searchCode = ValueNotifier(false);

  VoidCallback onPressedSearchCode(BuildContext context) => () async {
        if (!formKey.currentState!.validate()) {
          return;
        }

        futurePlayerAddedDto = getIt<GameplayService>().enterInGameplay(code);
        searchCode.value = true;
      };

  VoidCallback onPressedEnterInGameplay(BuildContext context, PlayerAddedDto playerAddedDto) => () {
        LocalStorage.setString(
          Keys.MEMORY_GAME_NAME,
          playerAddedDto.memoryGame.name,
        );

        context.router.push(
          GameplayRoute(
            memoryGameName: playerAddedDto.memoryGame.name,
          ),
        );
      };

  VoidCallback onPressedRetry() => () {
        searchCode.value = false;
      };

  VoidCallback onPressedExit(BuildContext context) => () {
        DashboardContext.of(context)!.hideCodeEntry();
      };
}
