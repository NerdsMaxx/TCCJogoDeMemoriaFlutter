import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/features/gameplay/models/memory_game_gameplay_model.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class GameplayController {
  GameplayController(String? memoryGameName, String? creatorUsername) {
    this.memoryGameName = memoryGameName ?? LocalStorage.getString(Keys.MEMORY_GAME_NAME)!;
    this.creatorUsername = creatorUsername ?? LocalStorage.getString(Keys.CREATOR_USERNAME)!;

    futureMemoryGameDto = getIt<MemoryGameService>().getMemoryGame(this.memoryGameName, this.creatorUsername);
  }

  late final String memoryGameName;
  late final String creatorUsername;
  late final Future<MemoryGameDto> futureMemoryGameDto;
  late final MemoryGameGameplayModel memoryGameGameplayModel;
  final ValueNotifier<bool> showCard = ValueNotifier(false);
  final List<CardGameplayModel> cardGameplayList = [];
}
