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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../auth/login/login_page.dart' as _i2;
import '../features/cards_editing/pages/cards_adding_page.dart' as _i5;
import '../features/cards_editing/pages/cards_editing_page.dart' as _i4;
import '../features/dashboard/pages/dashboard_page.dart' as _i3;
import 'guard/auth_guard.dart' as _i8;
import 'router_observer/initial_route.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter({
    _i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitialRoute(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardPage(),
      );
    },
    CardsEditingRoute.name: (routeData) {
      final args = routeData.argsAs<CardsEditingRouteArgs>(
          orElse: () => const CardsEditingRouteArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CardsEditingPage(
          key: args.key,
          memoryGameName: args.memoryGameName,
        ),
      );
    },
    CardAddingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CardsAddingPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          InitialRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i6.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          guards: [authGuard],
        ),
        _i6.RouteConfig(
          CardsEditingRoute.name,
          path: '/dashboard/cards-editing',
          guards: [authGuard],
        ),
        _i6.RouteConfig(
          CardAddingRoute.name,
          path: '/dashboard/card-adding',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [_i1.InitialRoute]
class InitialRoute extends _i6.PageRouteInfo<void> {
  const InitialRoute()
      : super(
          InitialRoute.name,
          path: '/',
        );

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard',
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i4.CardsEditingPage]
class CardsEditingRoute extends _i6.PageRouteInfo<CardsEditingRouteArgs> {
  CardsEditingRoute({
    _i7.Key? key,
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

  final _i7.Key? key;

  final String? memoryGameName;

  @override
  String toString() {
    return 'CardsEditingRouteArgs{key: $key, memoryGameName: $memoryGameName}';
  }
}

/// generated route for
/// [_i5.CardsAddingPage]
class CardAddingRoute extends _i6.PageRouteInfo<void> {
  const CardAddingRoute()
      : super(
          CardAddingRoute.name,
          path: '/dashboard/card-adding',
        );

  static const String name = 'CardAddingRoute';
}
