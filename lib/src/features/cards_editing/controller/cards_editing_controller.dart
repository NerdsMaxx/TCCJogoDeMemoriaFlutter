import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';
import 'package:memory_game_web/src/features/cards_editing/models/memory_game_editing_model.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class CardsEditingController {
  CardsEditingController(String? memoryGameName) {
    this.memoryGameName = memoryGameName ?? LocalStorage.getString(Keys.MEMORY_GAME_NAME)!;
    futureMemoryGameDto = getIt<MemoryGameService>().getMemoryGame(this.memoryGameName);
  }

  late final String memoryGameName;
  late final Future<MemoryGameDto> futureMemoryGameDto;
  late final MemoryGameEditingModel memoryGameEditingModel;
  final ValueNotifier<bool> showEditableCard = ValueNotifier(false);
  final List<CardEditingModel> cardEditingList = [];
}
