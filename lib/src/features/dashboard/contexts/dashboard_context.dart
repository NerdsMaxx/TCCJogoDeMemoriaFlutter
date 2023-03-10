import 'package:flutter/material.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';

class DashboardContext extends InheritedWidget {
  DashboardContext({
    super.key,
    required super.child,
  });

  final ValueNotifier<bool> codeEntry = ValueNotifier(false);
  final ValueNotifier<bool> codeGenerator = ValueNotifier(false);
  MemoryGameDto? memoryGameDto;

  void showCodeEntry() => codeEntry.value = true;

  void hideCodeEntry() => codeEntry.value = false;

  void showCodeGenerator() => codeGenerator.value = true;

  void hideCodeGenerator() => codeGenerator.value = false;

  void setMemoryGameDto(MemoryGameDto memoryGameDto) => this.memoryGameDto = memoryGameDto;

  static DashboardContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DashboardContext>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
