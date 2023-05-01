import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/gameplay_model.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/models/player_added_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';
import 'package:memory_game_web/src/utils/snack_bar_util.dart';
import 'package:memory_game_web/src/widgets/custom_snack_bar_widget.dart';

class CardViewModel {
  CardViewModel({
    required this.memoryGame,
    required this.context,
  }) {
    isCreator = getIt<Auth>().isCreator();
    isPlayer = getIt<Auth>().isPlayer();

    dashboardContext = DashboardContext.of(context)!;

    searchForCreator = dashboardContext.searchForCreator;
    searchForPlayer = dashboardContext.searchForPlayer;
  }

  final MemoryGameModel memoryGame;
  final BuildContext context;
  late final DashboardContext dashboardContext;

  late final bool isCreator;
  late final bool isPlayer;

  late bool searchForCreator;
  late bool searchForPlayer;

  final GameplayService gameplayService = getIt<GameplayService>();

  VoidCallback onPressedGameplay([bool isTestingForCreator = false]) {
    return () async {
      try {
        GameplayModel? gameplay;

        if (isTestingForCreator) {
          LocalStorage.setString(
            Keys.MEMORY_GAME_NAME,
            memoryGame.name,
          );

          LocalStorage.setString(
            Keys.CREATOR_USERNAME,
            memoryGame.creator,
          );

          LocalStorage.setBool(
            Keys.ALONE,
            false,
          );
        } else {
          gameplay = await gameplayService.generateGameplay(
              GameplayModel(memoryGame: memoryGame.name, creator: memoryGame.creator, alone: true));
          final PlayerAddedModel playerAdded =
              await gameplayService.enterInGameplay(gameplay.code!);

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

          LocalStorage.setBool(
            Keys.ALONE,
            true,
          );
        }

        LocalStorage.setBool(
          Keys.TESTING_FOR_CREATOR,
          isTestingForCreator,
        );

        if (context.mounted) {
          context.router.push(
            GameplayRoute(
              memoryGameName: memoryGame.name,
              creatorUsername: memoryGame.creator,
              gameplayCode: gameplay?.code,
              isTestingForCreator: isTestingForCreator,
              alone: !isTestingForCreator,
            ),
          );
        }
      } catch (error) {
        if (error is CustomException) {
          SnackBarUtil.showSnackBar(context, CustomSnackBarWidget.forError(error.message));
        }
      }
    };
  }

  void onPressedEditing() {
    LocalStorage.setString(
      Keys.MEMORY_GAME_NAME,
      memoryGame.name,
    );

    context.router.push(
      CardsEditingRoute(memoryGameName: memoryGame.name),
    );
  }

  void onPressedCodeGenerator() {
    dashboardContext.memoryGame = memoryGame;
    dashboardContext.showCodeGenerator();
  }

  void onPressedTesting() {}
}
