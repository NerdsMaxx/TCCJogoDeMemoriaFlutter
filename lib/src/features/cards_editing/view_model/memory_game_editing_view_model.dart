import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/memory_game_editing_model.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class MemoryGameEditingViewModel {
  MemoryGameEditingViewModel(this.context, String? memoryGameName) {
    memoryGameEditingContext = MemoryGameEditingContext.of(context)!;
    this.memoryGameName = memoryGameName ?? LocalStorage.getString(Keys.MEMORY_GAME_NAME)!;
    futureMemoryGameModel = getIt<MemoryGameService>().getMemoryGame(this.memoryGameName);
  }

  final BuildContext context;
  late final MemoryGameEditingContext memoryGameEditingContext;

  late final String memoryGameName;
  late final Future<MemoryGameModel> futureMemoryGameModel;
  late final MemoryGameEditingModel memoryGameEditingModel;
}
