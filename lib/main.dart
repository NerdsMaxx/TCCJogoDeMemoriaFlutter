import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/routes/router_observer/router_observer.dart';
import 'package:memory_game_web/src/routes/routes.dart';
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

  final AppRouter _appRouter = AppRouter();
  final NavigatorObserver _observer = RouterObserver();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [_observer],
      ),
    );
  }
}