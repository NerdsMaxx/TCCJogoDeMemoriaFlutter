import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:memory_game_web/src/auth/change_password/change_password_page.dart';
import 'package:memory_game_web/src/auth/create_account/create_account_page.dart';
import 'package:memory_game_web/src/auth/login/login_page.dart';
import 'package:memory_game_web/src/features/cards_editing/pages/memory_game_adding_page.dart';
import 'package:memory_game_web/src/features/cards_editing/pages/memory_game_editing_page.dart';
import 'package:memory_game_web/src/features/dashboard/pages/dashboard_page.dart';
import 'package:memory_game_web/src/features/gameplay/pages/gameplay_page.dart';
import 'package:memory_game_web/src/features/gameplay_management/pages/gameplay_management_page.dart';
import 'package:memory_game_web/src/features/scores/score_page.dart';

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
      page: CreateAccount,
      name: 'CreateAccountRoute',
      path: '/create',
    ),
    AutoRoute(
      page: ChangePasswordPage,
      name: 'ChangePasswordRoute',
      path: '/change-password',
    ),
    AutoRoute(
      page: DashboardPage,
      name: 'DashboardRoute',
      path: '/dashboard',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: MemoryGameEditingPage,
      name: 'CardsEditingRoute',
      path: '/dashboard/cards-editing',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: MemoryGameAddingPage,
      name: 'CardAddingRoute',
      path: '/dashboard/cards-adding',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: GameplayPage,
      name: 'GameplayRoute',
      path: '/dashboard/gameplay',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: GameplayManagementPage,
      name: 'GameplayManagementRoute',
      path: '/codes',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: ScorePage,
      name: 'ScoreRoute',
      path: '/scores',
      guards: [AuthGuard],
    )
  ],
)
class $AppRouter {}
