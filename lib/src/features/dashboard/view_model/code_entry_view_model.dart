import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/player_added_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';

class CodeEntryViewModel {
  CodeEntryViewModel(this.context);

  final BuildContext context;

  late final GameplayService gameplayService = getIt<GameplayService>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final validatorCode = ValidationBuilder(requiredMessage: 'Deve ter 4 dígitos!')
      .minLength(4, 'Deve ter 4 dígitos.')
      .build();

  String code = '';
  String label = '';

  Future<PlayerAddedModel>? futurePlayerAddedModel;
  ValueNotifier<bool> searchCode = ValueNotifier(false);

  void onPressedSearchCode() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    futurePlayerAddedModel = gameplayService.enterInGameplay(code);
    searchCode.value = true;
  }

  VoidCallback onPressedEnterInGameplay(PlayerAddedModel playerAddedModel) {
    return () {
      LocalStorage.setString(
        Keys.MEMORY_GAME_NAME,
        playerAddedModel.memoryGame.name,
      );

      LocalStorage.setString(
        Keys.CREATOR_USERNAME,
        playerAddedModel.memoryGame.creator,
      );

      LocalStorage.setString(
        Keys.GAMEPLAY_CODE,
        code,
      );

      context.router.push(
        GameplayRoute(
          memoryGameName: playerAddedModel.memoryGame.name,
          creatorUsername: playerAddedModel.memoryGame.creator,
          gameplayCode: code,
        ),
      );

      DashboardContext.of(context)!.codeEntry.value = false;
    };
  }

  void onPressedRetry() {
    searchCode.value = false;
  }

  void onPressedExit() {
    DashboardContext.of(context)!.hideCodeEntry();
  }

  void dispose() {
    searchCode.dispose();
  }
}
