import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class MemoryGameFieldViewModel {
  MemoryGameFieldViewModel(this.context) {
    memoryGameEditingContext = MemoryGameEditingContext.of(context)!;
    memoryGameName = memoryGameEditingContext.memoryGameName;
    subjects = memoryGameEditingContext.subjectList.join(', ');
  }

  void updateContext(BuildContext context) {
    this.context = context;
  }

  BuildContext context;
  late final MemoryGameEditingContext memoryGameEditingContext;

  final Auth auth = getIt<Auth>();
  final MemoryGameService memoryGameService = getIt<MemoryGameService>();
  final formKeyMemoryGameNameAndSubjects = GlobalKey<FormState>();

  late String memoryGameName;
  late String subjects;

  void onChangedMemoryGameName(String value) {
    memoryGameEditingContext.memoryGameName = value;
  }

  void onChangedSubject(String value) {
    subjects = value;
    memoryGameEditingContext.subjectList = value.split(', ').toList();
  }

  void onPressedSave() {
    final MemoryGameModel memoryGame = MemoryGameModel(
      name: MemoryGameEditingContext.of(context)!.memoryGameName,
      creator: auth.username!,
      subjectList: MemoryGameEditingContext.of(context)!.subjectList,
    );

    if (memoryGameEditingContext.isNew) {
      memoryGameService.saveMemoryGame(memoryGame);
    } else {
      memoryGameService.updateMemoryGame(
        memoryGameEditingContext.oldMemoryGameName!,
        memoryGame,
      );
    }

    memoryGameEditingContext.showSavedMemoryGame.value = true;
  }
}
