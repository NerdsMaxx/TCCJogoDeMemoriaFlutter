import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/gameplay_model.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/models/player_added_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';

class CardViewModel {
  CardViewModel({
    required this.memoryGame,
    required this.context,
  });

  final MemoryGameModel memoryGame;
  final BuildContext context;

  final GameplayService gameplayService = getIt<GameplayService>();

  void onPressedGameplay() async {
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
    DashboardContext.of(context)!.setMemoryGame(memoryGame);
    DashboardContext.of(context)!.showCodeGenerator();
  }
}
