import 'package:go_router/go_router.dart';

import 'package:jogo_de_memoria_flutter/src/pages/creation_tool/creation_tool.dart';
import 'package:jogo_de_memoria_flutter/src/pages/dashboard/dashboard.dart';
import 'package:jogo_de_memoria_flutter/src/pages/login/login.dart';

GoRouter routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const Dashboard(),
    ),
    GoRoute(
      path: '/creation_tool',
      builder: (context, state) => const CreationTool(),
    )
  ],
);
