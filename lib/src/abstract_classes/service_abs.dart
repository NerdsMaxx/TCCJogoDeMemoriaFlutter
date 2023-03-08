import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/interfaces/api_interface.dart';

abstract class Service {
  final Auth auth;
  final ApiInterface api;

  const Service(this.auth, this.api);
}
