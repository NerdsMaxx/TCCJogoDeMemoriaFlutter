import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/routes/guard/auth_guard.dart';
import 'package:memory_game_web/src/routes/router_observer/router_observer.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/themes/theme.dart';

void main() {
  usePathUrlStrategy();
  LocalStorage.init();
  configureDependencies();
  debugPaintSizeEnabled = false;
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [
          RouterObserver(),
        ],
      ),
    );
  }
}
