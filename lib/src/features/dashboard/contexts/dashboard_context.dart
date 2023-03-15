import 'package:flutter/material.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';

class DashboardContext extends InheritedWidget {
  DashboardContext({
    super.key,
    required super.child,
  });

  final ValueNotifier<bool> codeEntry = ValueNotifier(false);
  final ValueNotifier<bool> codeGenerator = ValueNotifier(false);
  MemoryGameModel? memoryGameModel;

  void showCodeEntry() => codeEntry.value = true;

  void hideCodeEntry() => codeEntry.value = false;

  void showCodeGenerator() => codeGenerator.value = true;

  void hideCodeGenerator() => codeGenerator.value = false;

  void setMemoryGameModel(MemoryGameModel memoryGameModel) =>
      this.memoryGameModel = memoryGameModel;

  static DashboardContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DashboardContext>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
