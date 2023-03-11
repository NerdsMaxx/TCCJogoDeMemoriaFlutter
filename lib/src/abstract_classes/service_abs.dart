import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/interfaces/http_interface.dart';

abstract class Service {
  final Auth auth;
  final HttpInterface http;

  const Service(this.auth, this.http);
}
