import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';

class DashboardContext extends InheritedWidget {
  DashboardContext({
    super.key,
    required super.child,
  });

  bool _searchForCreator = getIt<Auth>().isCreator();

  final ValueNotifier<bool> codeEntry = ValueNotifier(false);
  final ValueNotifier<bool> codeGenerator = ValueNotifier(false);
  MemoryGameModel? memoryGame;

  late Future<List<MemoryGameModel>> futureMemoryGameList;
  final ValueNotifier<bool> reloadMemoryGameList = ValueNotifier(false);

  void showCodeEntry() => codeEntry.value = true;

  void hideCodeEntry() => codeEntry.value = false;

  void showCodeGenerator() => codeGenerator.value = true;

  void hideCodeGenerator() => codeGenerator.value = false;

  void reloadSearch() => reloadMemoryGameList.value = !reloadMemoryGameList.value;

  void changeSearchForCreator() => _searchForCreator = true;

  void changeSearchForPlayer() => _searchForCreator = false;

  bool get searchForCreator => _searchForCreator;

  bool get searchForPlayer => !_searchForCreator;

  void dispose() {
    codeEntry.dispose();
    codeGenerator.dispose();
    reloadMemoryGameList.dispose();
  }

  static DashboardContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DashboardContext>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
