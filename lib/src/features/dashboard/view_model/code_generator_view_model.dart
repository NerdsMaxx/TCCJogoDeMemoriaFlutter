import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/models/gameplay_model.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';

class CodeGeneratorViewModel {
  CodeGeneratorViewModel(this.context) {
    memoryGame = DashboardContext.of(context)!.memoryGameModel!;

    futureCode = getIt<GameplayService>().generateGameplay(
        GameplayModel(memoryGame: memoryGame.name, creator: memoryGame.creator, alone: false));
  }

  final BuildContext context;
  late Future<GameplayModel> futureCode;
  late final MemoryGameModel memoryGame;
  final ValueNotifier<bool> reload = ValueNotifier(false);

  void onPressedCodeGenerator() {
    futureCode = getIt<GameplayService>().generateGameplay(
        GameplayModel(memoryGame: memoryGame.name, creator: memoryGame.creator, alone: false));
    reload.value = !reload.value;
  }

  void onPressedExit() {
    DashboardContext.of(context)!.hideCodeGenerator();
  }

  void dispose() {
    reload.dispose();
  }
}
