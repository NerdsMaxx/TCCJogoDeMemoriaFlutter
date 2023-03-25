import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';

class TitleViewModel {
  TitleViewModel(this.context);

  final BuildContext context;

  void onPressedAdding() {
    context.router.push(const CardAddingRoute());
  }

  void onPressedCodeEntry() {
    DashboardContext.of(context)!.showCodeEntry();
  }

  void onPressedGameplayManagement() {
    context.router.push(const GameplayManagementRoute());
  }

  void onPressedHistoryGameplay() {
     context.router.push(ScoreRoute(isPlayer: true));
  }
}