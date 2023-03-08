import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/auth/login/login_page.dart';

class InitialRoute extends StatefulWidget {
  const InitialRoute({super.key});

  @override
  State<InitialRoute> createState() => _InitialRouteState();
}

class _InitialRouteState extends State<InitialRoute> with AutoRouteAware {
  AutoRouteObserver? _observer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _observer = RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      _observer!.subscribe(this, context.routeData);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _observer!.unsubscribe(this);
  }

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
