import 'package:auto_route/auto_route.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final Auth auth = getIt<Auth>();

    if (auth.isValid()) {
      if (auth.isNotCreator() &&
          (router.currentPath == '/dashboard/cards-editing' ||
              router.currentPath == '/dashboard/cards-adding')) {
        router.pushNamed('/dashboard');
        return;
      }

      resolver.next();
    } else {
      router.pushNamed('/');
    }

    
  }
}
