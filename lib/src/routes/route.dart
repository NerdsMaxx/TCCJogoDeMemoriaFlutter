import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogo_de_memoria_flutter/src/auth/auth.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/pages/creation_tool_page.dart';
import 'package:jogo_de_memoria_flutter/src/features/dashboard/pages/dashboard_page.dart';
import 'package:jogo_de_memoria_flutter/src/features/login/pages/login_page.dart';

GoRouter routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        Object? extra = state.extra;

        if (extra is Auth) {
          return DashboardPage(auth: extra);
        }

        return const SizedBox.shrink();
      },
    ),
    GoRoute(
        path: '/creation_tool',
        builder: (context, state) {
          Object? extra = state.extra;

          if (extra is List<CreateOrEditCardFirstStepComponent>?) {
            return CreationToolPage(
              cardsWidget: extra,
            );
          }

          return const SizedBox.shrink();
        })
  ],
);

extension GoRouterExtension on GoRouter {
  void popUntil(String route) {
    while (location != route && canPop()) {
      pop();
    }
  }
}
