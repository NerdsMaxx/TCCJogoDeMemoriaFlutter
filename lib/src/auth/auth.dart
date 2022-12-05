import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Auth.instance();

  static Future<void> setAuth(final String username) async {
    (await _sharedPreferences).setString('username', username);
  }

  static final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  Future<String> get username async {
    return (await _sharedPreferences).getString('username')!;
  }
}
