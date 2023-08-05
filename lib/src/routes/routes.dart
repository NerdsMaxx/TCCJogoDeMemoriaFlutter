import 'package:auto_route/auto_route.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'guard/auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: InitialRoute.page,
      path: '/',
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/login',
    ),
    AutoRoute(
      page: CreateAccountRoute.page,
      path: '/create',
    ),
    AutoRoute(
      page: ChangePasswordRoute.page,
      path: '/change-password',
    ),
    AutoRoute(
      page: DashboardRoute.page,
      path: '/dashboard',
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: CardsEditingRoute.page,
      path: '/dashboard/cards-editing',
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: CardAddingRoute.page,
      path: '/dashboard/cards-adding',
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: GameplayRoute.page,
      path: '/dashboard/gameplay',
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: GameplayManagementRoute.page,
      path: '/gameplay-management',
      guards: [AuthGuard()],
    ),
    AutoRoute(
      page: ScoreRoute.page,
      path: '/scores',
      guards: [AuthGuard()],
    ),
  ];
}