import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class DashboardController {
  DashboardController() {
    futureMemoryGameDtoList = getIt<MemoryGameService>().getAllMemoryGame();
  }

  late final Future<List<MemoryGameDto>> futureMemoryGameDtoList;

  VoidCallback onPressedGameplay(BuildContext context) => () {};

  VoidCallback onPressedEditing(BuildContext context, MemoryGameDto memoryGameDto) => () {
        LocalStorage.setString(
          Keys.MEMORY_GAME_NAME,
          memoryGameDto.name,
        );

        context.router.push(
          CardsEditingRoute(memoryGameName: memoryGameDto.name),
        );
      };

  VoidCallback onPressedAdding(BuildContext context) => () {
        context.router.push(CardAddingRoute());
      };
}
