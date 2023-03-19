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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../auth/create_account/create_account_page.dart' as _i7;
import '../auth/login/login_page.dart' as _i2;
import '../features/cards_editing/pages/cards_adding/cards_adding_page.dart'
    as _i5;
import '../features/cards_editing/pages/cards_editing/cards_editing_page.dart'
    as _i4;
import '../features/dashboard/pages/dashboard/dashboard_page.dart' as _i3;
import '../features/gameplay/pages/main_page.dart' as _i6;
import 'guard/auth_guard.dart' as _i10;
import 'router_observer/initial_route.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter({
    _i9.GlobalKey<_i9.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i10.AuthGuard authGuard;

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitialRoute(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    CardsEditingRoute.name: (routeData) {
      final args = routeData.argsAs<CardsEditingRouteArgs>(
          orElse: () => const CardsEditingRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CardsEditingPage(
          key: args.key,
          memoryGameName: args.memoryGameName,
          isAdding: args.isAdding,
        ),
      );
    },
    CardAddingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CardsAddingPage(),
      );
    },
    GameplayRoute.name: (routeData) {
      final args = routeData.argsAs<GameplayRouteArgs>(
          orElse: () => const GameplayRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.MainPage(
          key: args.key,
          memoryGameName: args.memoryGameName,
          creatorUsername: args.creatorUsername,
          gameplayCode: args.gameplayCode,
        ),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.CreateAccount(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          InitialRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i8.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          guards: [authGuard],
        ),
        _i8.RouteConfig(
          CardsEditingRoute.name,
          path: '/dashboard/cards-editing',
          guards: [authGuard],
        ),
        _i8.RouteConfig(
          CardAddingRoute.name,
          path: '/dashboard/cards-adding',
          guards: [authGuard],
        ),
        _i8.RouteConfig(
          GameplayRoute.name,
          path: '/dashboard/gameplay',
          guards: [authGuard],
        ),
        _i8.RouteConfig(
          CreateAccountRoute.name,
          path: '/create',
        ),
      ];
}

/// generated route for
/// [_i1.InitialRoute]
class InitialRoute extends _i8.PageRouteInfo<void> {
  const InitialRoute()
      : super(
          InitialRoute.name,
          path: '/',
        );

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.CardsEditingPage]
class CardsEditingRoute extends _i8.PageRouteInfo<CardsEditingRouteArgs> {
  CardsEditingRoute({
    _i9.Key? key,
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

  final _i9.Key? key;

  final String? memoryGameName;

  final bool isAdding;

  @override
  String toString() {
    return 'CardsEditingRouteArgs{key: $key, memoryGameName: $memoryGameName, isAdding: $isAdding}';
  }
}

/// generated route for
/// [_i5.CardsAddingPage]
class CardAddingRoute extends _i8.PageRouteInfo<void> {
  const CardAddingRoute()
      : super(
          CardAddingRoute.name,
          path: '/dashboard/cards-adding',
        );

  static const String name = 'CardAddingRoute';
}

/// generated route for
/// [_i6.MainPage]
class GameplayRoute extends _i8.PageRouteInfo<GameplayRouteArgs> {
  GameplayRoute({
    _i9.Key? key,
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

  final _i9.Key? key;

  final String? memoryGameName;

  final String? creatorUsername;

  final String? gameplayCode;

  @override
  String toString() {
    return 'GameplayRouteArgs{key: $key, memoryGameName: $memoryGameName, creatorUsername: $creatorUsername, gameplayCode: $gameplayCode}';
  }
}

/// generated route for
/// [_i7.CreateAccount]
class CreateAccountRoute extends _i8.PageRouteInfo<void> {
  const CreateAccountRoute()
      : super(
          CreateAccountRoute.name,
          path: '/create',
        );

  static const String name = 'CreateAccountRoute';
}
