import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/src/api/http_impl.dart';
import 'package:memory_game_web/src/enums/user_type_enum.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/interfaces/http_interface.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';

part 'user.dart';

@injectable
class Auth {
  static const String TOKEN_KEY = 'token';

  final HttpInterface _api;
  Auth(@Named.from(HttpImpl) this._api);

  Future<void> login(String username, String password) async {
    Response response = await _api.post(
      'login',
      body: {
        'username': username,
        'password': password,
      },
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

  Future<void> createLogin(
    String name,
    String username,
    String email,
    String password,
    String type,
  ) async {
    Response response = await _api.post(
      '',
      body: {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'type': type,
      },
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

  bool isNotCreator() {
    return !isCreator();
  }

  bool isPlayer() {
    return _user?._userType == UserType.player;
  }

  bool isNotPlayer() {
    return !isPlayer();
  }
}
