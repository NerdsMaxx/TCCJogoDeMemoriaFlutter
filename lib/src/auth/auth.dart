import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  Auth(String username) {
    _sharedPreferences.then((value) => value.setString('username', username));
  }

  Auth.instance();

  static final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();

  String get username {
    String username = '';
    _sharedPreferences.then((value) => username = value.getString('username')!);
    return username;
  }
}
