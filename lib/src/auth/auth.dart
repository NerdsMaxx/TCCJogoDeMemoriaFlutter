import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/src/api/api.dart';
import 'package:memory_game_web/src/enums/user_type_enum.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/interfaces/api_interface.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';

part 'user.dart';

@injectable
class Auth {
  static const String TOKEN_KEY = 'token';

  final ApiInterface _api;
  Auth(@Named.from(Api) this._api);

  Future<void> login(String username, String password) async {
    Response response = await _api.post(
      'login',
      {'username': username, 'password': password},
    );

    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      _User user = _User()
        .._username = json['username']
        .._email = json['email']
        .._userType = UserType.getUserType(json['type']);

      await LocalStorage.setObject(_User.USER_KEY, user.toJson());
      await LocalStorage.setString(TOKEN_KEY, json['jwtToken']);

      return;
    }

    throw CustomException('Deu algum erro!');
  }

  String? get token => LocalStorage.getString(TOKEN_KEY);

  Future<void> clear() async {
    await LocalStorage.clearAll();
  }

  bool isValid() {
    return token != null;
  }

  _User? get _user => _User.getCurrentUser();

  String? get username => _user?._username;

  String? get email => _user?._email;

  bool isCreator() {
    return _user?._userType == UserType.creator;
  }

  bool isPlayer() {
    return _user?._userType == UserType.player;
  }
}
