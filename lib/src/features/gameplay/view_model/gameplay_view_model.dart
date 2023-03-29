import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/features/gameplay/models/memory_game_gameplay_model.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class GameplayViewModel {
  GameplayViewModel(this.context, String? memoryGameName, String? creatorUsername) {
    this.memoryGameName = memoryGameName ?? LocalStorage.getString(Keys.MEMORY_GAME_NAME)!;
    this.creatorUsername = creatorUsername ?? LocalStorage.getString(Keys.CREATOR_USERNAME)!;

    futureMemoryGameModel =
        getIt<MemoryGameService>().getMemoryGame(this.memoryGameName, this.creatorUsername);

    memoryGameGameplayContext = MemoryGameGameplayContext.of(context)!;
  }

  final BuildContext context;
  late final MemoryGameGameplayContext memoryGameGameplayContext;

  late final String memoryGameName;
  late final String creatorUsername;
  late final Future<MemoryGameModel> futureMemoryGameModel;
  late final MemoryGameGameplayModel memoryGameGameplayModel;
  final List<CardGameplayModel> cardGameplayList = [];
}
