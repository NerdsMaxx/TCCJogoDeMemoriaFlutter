// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:memory_game_web/src/auth/change_password/change_password_page.dart'
    as _i10;
import 'package:memory_game_web/src/auth/create_account/create_account_page.dart'
    as _i9;
import 'package:memory_game_web/src/auth/login/login_page.dart' as _i8;
import 'package:memory_game_web/src/features/cards_editing/pages/memory_game_adding_page.dart'
    as _i5;
import 'package:memory_game_web/src/features/cards_editing/pages/memory_game_editing_page.dart'
    as _i6;
import 'package:memory_game_web/src/features/dashboard/pages/dashboard_page.dart'
    as _i1;
import 'package:memory_game_web/src/features/gameplay/pages/gameplay_page.dart'
    as _i4;
import 'package:memory_game_web/src/features/gameplay_management/gameplay_management_page.dart'
    as _i2;
import 'package:memory_game_web/src/features/scores/score_page.dart' as _i3;
import 'package:memory_game_web/src/routes/router_observer/initial_route.dart'
    as _i7;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    GameplayManagementRoute.name: (routeData) {
      final args = routeData.argsAs<GameplayManagementRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.GameplayManagementPage(
          key: args.key,
          currentGameplays: args.currentGameplays,
        ),
      );
    },
    ScoreRoute.name: (routeData) {
      final args = routeData.argsAs<ScoreRouteArgs>(
          orElse: () => const ScoreRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ScorePage(
          key: args.key,
          code: args.code,
          isPreviousGameplays: args.isPreviousGameplays,
          gameplayId: args.gameplayId,
          alone: args.alone,
        ),
      );
    },
    GameplayRoute.name: (routeData) {
      final args = routeData.argsAs<GameplayRouteArgs>(
          orElse: () => const GameplayRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.GameplayPage(
          key: args.key,
          memoryGameName: args.memoryGameName,
          creatorUsername: args.creatorUsername,
          gameplayCode: args.gameplayCode,
          isTestingForCreator: args.isTestingForCreator,
          alone: args.alone,
        ),
      );
    },
    CardAddingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MemoryGameAddingPage(),
      );
    },
    CardsEditingRoute.name: (routeData) {
      final args = routeData.argsAs<CardsEditingRouteArgs>(
          orElse: () => const CardsEditingRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MemoryGameEditingPage(
          key: args.key,
          memoryGameName: args.memoryGameName,
          isAdding: args.isAdding,
        ),
      );
    },
    InitialRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.InitialPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginPage(),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.CreateAccount(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ChangePasswordPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GameplayManagementPage]
class GameplayManagementRoute
    extends _i11.PageRouteInfo<GameplayManagementRouteArgs> {
  GameplayManagementRoute({
    _i12.Key? key,
    required bool currentGameplays,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          GameplayManagementRoute.name,
          args: GameplayManagementRouteArgs(
            key: key,
            currentGameplays: currentGameplays,
          ),
          initialChildren: children,
        );

  static const String name = 'GameplayManagementRoute';

  static const _i11.PageInfo<GameplayManagementRouteArgs> page =
      _i11.PageInfo<GameplayManagementRouteArgs>(name);
}

class GameplayManagementRouteArgs {
  const GameplayManagementRouteArgs({
    this.key,
    required this.currentGameplays,
  });

  final _i12.Key? key;

  final bool currentGameplays;

  @override
  String toString() {
    return 'GameplayManagementRouteArgs{key: $key, currentGameplays: $currentGameplays}';
  }
}

/// generated route for
/// [_i3.ScorePage]
class ScoreRoute extends _i11.PageRouteInfo<ScoreRouteArgs> {
  ScoreRoute({
    _i12.Key? key,
    String? code,
    bool isPreviousGameplays = false,
    int? gameplayId,
    bool? alone,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ScoreRoute.name,
          args: ScoreRouteArgs(
            key: key,
            code: code,
            isPreviousGameplays: isPreviousGameplays,
            gameplayId: gameplayId,
            alone: alone,
          ),
          initialChildren: children,
        );

  static const String name = 'ScoreRoute';

  static const _i11.PageInfo<ScoreRouteArgs> page =
      _i11.PageInfo<ScoreRouteArgs>(name);
}

class ScoreRouteArgs {
  const ScoreRouteArgs({
    this.key,
    this.code,
    this.isPreviousGameplays = false,
    this.gameplayId,
    this.alone,
  });

  final _i12.Key? key;

  final String? code;

  final bool isPreviousGameplays;

  final int? gameplayId;

  final bool? alone;

  @override
  String toString() {
    return 'ScoreRouteArgs{key: $key, code: $code, isPreviousGameplays: $isPreviousGameplays, gameplayId: $gameplayId, alone: $alone}';
  }
}

/// generated route for
/// [_i4.GameplayPage]
class GameplayRoute extends _i11.PageRouteInfo<GameplayRouteArgs> {
  GameplayRoute({
    _i12.Key? key,
    String? memoryGameName,
    String? creatorUsername,
    String? gameplayCode,
    bool? isTestingForCreator,
    bool? alone,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          GameplayRoute.name,
          args: GameplayRouteArgs(
            key: key,
            memoryGameName: memoryGameName,
            creatorUsername: creatorUsername,
            gameplayCode: gameplayCode,
            isTestingForCreator: isTestingForCreator,
            alone: alone,
          ),
          initialChildren: children,
        );

  static const String name = 'GameplayRoute';

  static const _i11.PageInfo<GameplayRouteArgs> page =
      _i11.PageInfo<GameplayRouteArgs>(name);
}

class GameplayRouteArgs {
  const GameplayRouteArgs({
    this.key,
    this.memoryGameName,
    this.creatorUsername,
    this.gameplayCode,
    this.isTestingForCreator,
    this.alone,
  });

  final _i12.Key? key;

  final String? memoryGameName;

  final String? creatorUsername;

  final String? gameplayCode;

  final bool? isTestingForCreator;

  final bool? alone;

  @override
  String toString() {
    return 'GameplayRouteArgs{key: $key, memoryGameName: $memoryGameName, creatorUsername: $creatorUsername, gameplayCode: $gameplayCode, isTestingForCreator: $isTestingForCreator, alone: $alone}';
  }
}

/// generated route for
/// [_i5.MemoryGameAddingPage]
class CardAddingRoute extends _i11.PageRouteInfo<void> {
  const CardAddingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CardAddingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CardAddingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MemoryGameEditingPage]
class CardsEditingRoute extends _i11.PageRouteInfo<CardsEditingRouteArgs> {
  CardsEditingRoute({
    _i12.Key? key,
    String? memoryGameName,
    bool isAdding = false,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CardsEditingRoute.name,
          args: CardsEditingRouteArgs(
            key: key,
            memoryGameName: memoryGameName,
            isAdding: isAdding,
          ),
          initialChildren: children,
        );

  static const String name = 'CardsEditingRoute';

  static const _i11.PageInfo<CardsEditingRouteArgs> page =
      _i11.PageInfo<CardsEditingRouteArgs>(name);
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
/// [_i7.InitialPage]
class InitialRoute extends _i11.PageRouteInfo<void> {
  const InitialRoute({List<_i11.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          initialChildren: children,
        );

  static const String name = 'InitialRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CreateAccount]
class CreateAccountRoute extends _i11.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ChangePasswordPage]
class ChangePasswordRoute extends _i11.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ChangePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
