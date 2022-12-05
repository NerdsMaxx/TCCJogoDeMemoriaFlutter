import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/pages/creation_tool_page.dart';
import 'package:jogo_de_memoria_flutter/src/features/dashboard/pages/dashboard_page.dart';
import 'package:jogo_de_memoria_flutter/src/features/login/pages/login_page.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/pages/memory_game_page.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

GoRouter routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/creation_tool',
      builder: (context, state) {
        Map? parameters = state.extra as Map?;

        if (parameters != null) {
          return CreationToolPage(
            cardsWidget: parameters['cardsWidget'],
            memoryGameName: parameters['name'],
          );
        }

        return const CreationToolPage();
        
      },
    ),
    GoRoute(
      path: '/memory_game',
      builder: (context, state) {
        List<CardModel>? cardList = state.extra as List<CardModel>?;

        if (cardList != null) {
          return MemoryGamePage(
            cardList: cardList,
          );
        }

        return const SizedBox.shrink();
      },
    )
  ],
);

extension GoRouterExtension on GoRouter {
  void popUntil(String route) {
    while (location != route && canPop()) {
      pop();
    }
  }
}
