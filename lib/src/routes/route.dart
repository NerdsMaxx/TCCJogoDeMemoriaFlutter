import 'package:go_router/go_router.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit_cards_grid_component.dart';

import 'package:jogo_de_memoria_flutter/src/features/dashboard/pages/dashboard_page.dart';
import 'package:jogo_de_memoria_flutter/src/features/login/pages/login_page.dart';

GoRouter routes = GoRouter(
  initialLocation: '/creation_tool',
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
      builder: (context, state) => const CreateOrEditCardsGridComponent(),
    )
  ],
);
