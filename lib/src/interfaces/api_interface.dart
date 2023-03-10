import 'package:http/http.dart' show Response;
import 'package:memory_game_web/src/auth/auth.dart';

abstract class ApiInterface {
  Future<Response> get(String request, {Auth? auth});
  Future<Response> post(String request, {dynamic body, Auth? auth});
  Future<Response> put(String request, {dynamic body, Auth? auth});
}
