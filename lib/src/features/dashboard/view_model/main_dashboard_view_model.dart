import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/models/gameplay_model.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

class MainDashboardViewModel {
  MainDashboardViewModel(BuildContext context) {
    dashboardContext = DashboardContext.of(context)!;
    dashboardContext.futureMemoryGameList =
        memoryGameService.getAllMemoryGame(getIt<Auth>().isCreator());
  }

  final MemoryGameService memoryGameService = getIt<MemoryGameService>();
  late final DashboardContext dashboardContext;
  late final Future<GameplayModel> futureGameplayModel;
}