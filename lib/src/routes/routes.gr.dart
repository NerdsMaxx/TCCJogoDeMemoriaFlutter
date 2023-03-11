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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../auth/login/login_page.dart' as _i2;
import '../features/cards_editing/pages/cards_adding/cards_adding_page.dart' as _i5;
import '../features/cards_editing/pages/cards_editing/cards_editing_page.dart' as _i4;
import '../features/dashboard/pages/dashboard/dashboard_page.dart' as _i3;
import '../features/gameplay/pages/gameplay_page.dart' as _i6;
import 'guard/auth_guard.dart' as _i9;
import 'router_observer/initial_route.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter({
    _i8.GlobalKey<_i8.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitialRoute(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    CardsEditingRoute.name: (routeData) {
      final args = routeData.argsAs<CardsEditingRouteArgs>(
          orElse: () => const CardsEditingRouteArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CardsEditingPage(
          key: args.key,
          memoryGameName: args.memoryGameName,
        ),
      );
    },
    CardAddingRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CardsAddingPage(),
      );
    },
    GameplayRoute.name: (routeData) {
      final args = routeData.argsAs<GameplayRouteArgs>(
          orElse: () => const GameplayRouteArgs());
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.GameplayPage(
          key: args.key,
          memoryGameName: args.memoryGameName,
          creatorUsername: args.creatorUsername,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          InitialRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i7.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          CardsEditingRoute.name,
          path: '/dashboard/cards-editing',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          CardAddingRoute.name,
          path: '/dashboard/card-adding',
          guards: [authGuard],
        ),
        _i7.RouteConfig(
          GameplayRoute.name,
          path: '/dashboard/gameplay',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.InitialRoute]
class InitialRoute extends _i7.PageRouteInfo<void> {
  const InitialRoute()
      : super(
          InitialRoute.name,
          path: '/',
        );

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.CardsEditingPage]
class CardsEditingRoute extends _i7.PageRouteInfo<CardsEditingRouteArgs> {
  CardsEditingRoute({
    _i8.Key? key,
    String? memoryGameName,
  }) : super(
          CardsEditingRoute.name,
          path: '/dashboard/cards-editing',
          args: CardsEditingRouteArgs(
            key: key,
            memoryGameName: memoryGameName,
          ),
        );

  static const String name = 'CardsEditingRoute';
}

class CardsEditingRouteArgs {
  const CardsEditingRouteArgs({
    this.key,
    this.memoryGameName,
  });

  final _i8.Key? key;

  final String? memoryGameName;

  @override
  String toString() {
    return 'CardsEditingRouteArgs{key: $key, memoryGameName: $memoryGameName}';
  }
}

/// generated route for
/// [_i5.CardsAddingPage]
class CardAddingRoute extends _i7.PageRouteInfo<void> {
  const CardAddingRoute()
      : super(
          CardAddingRoute.name,
          path: '/dashboard/card-adding',
        );

  static const String name = 'CardAddingRoute';
}

/// generated route for
/// [_i6.GameplayPage]
class GameplayRoute extends _i7.PageRouteInfo<GameplayRouteArgs> {
  GameplayRoute({
    _i8.Key? key,
    String? memoryGameName,
    String? creatorUsername,
  }) : super(
          GameplayRoute.name,
          path: '/dashboard/gameplay',
          args: GameplayRouteArgs(
            key: key,
            memoryGameName: memoryGameName,
            creatorUsername: creatorUsername,
          ),
        );

  static const String name = 'GameplayRoute';
}

class GameplayRouteArgs {
  const GameplayRouteArgs({
    this.key,
    this.memoryGameName,
    this.creatorUsername,
  });

  final _i8.Key? key;

  final String? memoryGameName;

  final String? creatorUsername;

  @override
  String toString() {
    return 'GameplayRouteArgs{key: $key, memoryGameName: $memoryGameName, creatorUsername: $creatorUsername}';
  }
}
