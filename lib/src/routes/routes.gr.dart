// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../auth/change_password/change_password_page.dart' as _i4;
import '../auth/create_account/create_account_page.dart' as _i3;
import '../auth/login/login_page.dart' as _i2;
import '../features/cards_editing/pages/cards_adding/cards_adding_page.dart'
    as _i7;
import '../features/cards_editing/pages/cards_editing/cards_editing_page.dart'
    as _i6;
import '../features/dashboard/pages/dashboard/dashboard_page.dart' as _i5;
import '../features/gameplay/pages/gameplay/gameplay_page.dart' as _i8;
import '../features/gameplay_management/pages/gameplay_management_page.dart'
    as _i9;
import '../features/scores/score_page.dart' as _i10;
import 'guard/auth_guard.dart' as _i13;
import 'router_observer/initial_route.dart' as _i1;

class AppRouter extends _i11.RootStackRouter {
  AppRouter({
    _i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i13.AuthGuard authGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitialRoute(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CreateAccount(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ChangePasswordPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.DashboardPage(),
      );
    },
    CardsEditingRoute.name: (routeData) {
      final args = routeData.argsAs<CardsEditingRouteArgs>(
          orElse: () => const CardsEditingRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.CardsEditingPage(
          key: args.key,
          memoryGameName: args.memoryGameName,
          isAdding: args.isAdding,
        ),
      );
    },
    CardAddingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.CardsAddingPage(),
      );
    },
    GameplayRoute.name: (routeData) {
      final args = routeData.argsAs<GameplayRouteArgs>(
          orElse: () => const GameplayRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.GameplayPage(
          key: args.key,
          memoryGameName: args.memoryGameName,
          creatorUsername: args.creatorUsername,
          gameplayCode: args.gameplayCode,
        ),
      );
    },
    GameplayManagementRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.GameplayManagementPage(),
      );
    },
    ScoreRoute.name: (routeData) {
      final args = routeData.argsAs<ScoreRouteArgs>(
          orElse: () => const ScoreRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.ScorePage(
          key: args.key,
          code: args.code,
        ),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          InitialRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i11.RouteConfig(
          CreateAccountRoute.name,
          path: '/create',
        ),
        _i11.RouteConfig(
          ChangePasswordRoute.name,
          path: '/change-password',
        ),
        _i11.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          guards: [authGuard],
        ),
        _i11.RouteConfig(
          CardsEditingRoute.name,
          path: '/dashboard/cards-editing',
          guards: [authGuard],
        ),
        _i11.RouteConfig(
          CardAddingRoute.name,
          path: '/dashboard/cards-adding',
          guards: [authGuard],
        ),
        _i11.RouteConfig(
          GameplayRoute.name,
          path: '/dashboard/gameplay',
          guards: [authGuard],
        ),
        _i11.RouteConfig(
          GameplayManagementRoute.name,
          path: '/codes',
          guards: [authGuard],
        ),
        _i11.RouteConfig(
          ScoreRoute.name,
          path: '/scores',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.InitialRoute]
class InitialRoute extends _i11.PageRouteInfo<void> {
  const InitialRoute()
      : super(
          InitialRoute.name,
          path: '/',
        );

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.CreateAccount]
class CreateAccountRoute extends _i11.PageRouteInfo<void> {
  const CreateAccountRoute()
      : super(
          CreateAccountRoute.name,
          path: '/create',
        );

  static const String name = 'CreateAccountRoute';
}

/// generated route for
/// [_i4.ChangePasswordPage]
class ChangePasswordRoute extends _i11.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(
          ChangePasswordRoute.name,
          path: '/change-password',
        );

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i5.DashboardPage]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i6.CardsEditingPage]
class CardsEditingRoute extends _i11.PageRouteInfo<CardsEditingRouteArgs> {
  CardsEditingRoute({
    _i12.Key? key,
    String? memoryGameName,
    bool isAdding = false,
  }) : super(
          CardsEditingRoute.name,
          path: '/dashboard/cards-editing',
          args: CardsEditingRouteArgs(
            key: key,
            memoryGameName: memoryGameName,
            isAdding: isAdding,
          ),
        );

  static const String name = 'CardsEditingRoute';
}

class CardsEditingRouteArgs {
  const CardsEditingRouteArgs({
    this.key,
    this.memoryGameName,
    this.isAdding = false,
  });

  final _i12.Key? key;

  final String? memoryGameName;

  final bool isAdding;

  @override
  String toString() {
    return 'CardsEditingRouteArgs{key: $key, memoryGameName: $memoryGameName, isAdding: $isAdding}';
  }
}

/// generated route for
/// [_i7.CardsAddingPage]
class CardAddingRoute extends _i11.PageRouteInfo<void> {
  const CardAddingRoute()
      : super(
          CardAddingRoute.name,
          path: '/dashboard/cards-adding',
        );

  static const String name = 'CardAddingRoute';
}

/// generated route for
/// [_i8.GameplayPage]
class GameplayRoute extends _i11.PageRouteInfo<GameplayRouteArgs> {
  GameplayRoute({
    _i12.Key? key,
    String? memoryGameName,
    String? creatorUsername,
    String? gameplayCode,
  }) : super(
          GameplayRoute.name,
          path: '/dashboard/gameplay',
          args: GameplayRouteArgs(
            key: key,
            memoryGameName: memoryGameName,
            creatorUsername: creatorUsername,
            gameplayCode: gameplayCode,
          ),
        );

  static const String name = 'GameplayRoute';
}

class GameplayRouteArgs {
  const GameplayRouteArgs({
    this.key,
    this.memoryGameName,
    this.creatorUsername,
    this.gameplayCode,
  });

  final _i12.Key? key;

  final String? memoryGameName;

  final String? creatorUsername;

  final String? gameplayCode;

  @override
  String toString() {
    return 'GameplayRouteArgs{key: $key, memoryGameName: $memoryGameName, creatorUsername: $creatorUsername, gameplayCode: $gameplayCode}';
  }
}

/// generated route for
/// [_i9.GameplayManagementPage]
class GameplayManagementRoute extends _i11.PageRouteInfo<void> {
  const GameplayManagementRoute()
      : super(
          GameplayManagementRoute.name,
          path: '/codes',
        );

  static const String name = 'GameplayManagementRoute';
}

/// generated route for
/// [_i10.ScorePage]
class ScoreRoute extends _i11.PageRouteInfo<ScoreRouteArgs> {
  ScoreRoute({
    _i12.Key? key,
    String? code,
  }) : super(
          ScoreRoute.name,
          path: '/scores',
          args: ScoreRouteArgs(
            key: key,
            code: code,
          ),
        );

  static const String name = 'ScoreRoute';
}

class ScoreRouteArgs {
  const ScoreRouteArgs({
    this.key,
    this.code,
  });

  final _i12.Key? key;

  final String? code;

  @override
  String toString() {
    return 'ScoreRouteArgs{key: $key, code: $code}';
  }
}
