import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:memory_game_web/src/auth/login/login_page.dart';
import 'package:memory_game_web/src/features/cards_editing/pages/cards_adding_page.dart';
import 'package:memory_game_web/src/features/cards_editing/pages/cards_editing_page.dart';
import 'package:memory_game_web/src/features/dashboard/pages/dashboard/dashboard_page.dart';
import 'package:memory_game_web/src/features/gameplay/pages/gameplay_page.dart';

import 'package:memory_game_web/src/routes/router_observer/initial_route.dart';

import 'guard/auth_guard.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: InitialRoute,
      name: 'InitialRoute',
      path: '/',
    ),
    AutoRoute(
      page: LoginPage,
      name: 'LoginRoute',
      path: '/login',
    ),
    AutoRoute(
      page: DashboardPage,
      name: 'DashboardRoute',
      path: '/dashboard',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: CardsEditingPage,
      name: 'CardsEditingRoute',
      path: '/dashboard/cards-editing',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: CardsAddingPage,
      name: 'CardAddingRoute',
      path: '/dashboard/card-adding',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: GameplayPage,
      name: 'GameplayRoute',
      path: '/dashboard/gameplay',
      guards: [AuthGuard],
    ),
  ],
)
class $AppRouter {}
