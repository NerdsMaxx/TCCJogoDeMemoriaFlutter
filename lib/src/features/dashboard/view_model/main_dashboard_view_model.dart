import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/models/gameplay_model.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class MainDashboardViewModel {
  MainDashboardViewModel(BuildContext context) {
    DashboardContext.of(context)!.futureMemoryGameList = memoryGameService.getAllMemoryGame();
  }

  final MemoryGameService memoryGameService = getIt<MemoryGameService>();
  late final Future<GameplayModel> futureGameplayModel;
}
