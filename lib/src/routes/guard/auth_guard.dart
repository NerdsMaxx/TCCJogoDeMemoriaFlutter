import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final Auth auth = getIt<Auth>();

    if (auth.isValid()) {
      bool backToDashboard = auth.isNotCreator() &&
          (router.currentPath == '/dashboard/cards-editing' ||
              router.currentPath == '/dashboard/cards-adding');

      if (backToDashboard) {
        router.push(const DashboardRoute());
        return;
      }

      resolver.next();
    } else {
      router.pushNamed('/');
    }
  }
}