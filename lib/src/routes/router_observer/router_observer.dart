import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';

class RouterObserver extends AutoRouterObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    
    final Auth auth = getIt<Auth>();

    if (previousRoute?.settings.name == 'InitialRoute') {
      if (auth.isValid()) {
        auth.clear();
      }
    }
    

    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    final Auth auth = getIt<Auth>();

    if (route.settings.name == 'InitialRoute') {
      if (auth.isValid()) {
        auth.clear();
      }
    }

    super.didPush(route, previousRoute);
  }
}
