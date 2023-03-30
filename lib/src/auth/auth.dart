import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/src/api/http_impl.dart';
import 'package:memory_game_web/src/auth/models/new_account_model.dart';
import 'package:memory_game_web/src/enums/user_type_enum.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/interfaces/http_interface.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';

part 'user.dart';

@injectable
class Auth {
  static const String TOKEN_KEY = 'token';

  final HttpInterface _http;
  Auth(@Named.from(HttpImpl) this._http);

  Future<void> login(String username, String password) async {
    Response response = await _http.post(
      'login',
      body: {
        'username': username,
        'password': password,
      },
    );

    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      _User user = _User.fromJson(json)!;

      await LocalStorage.setObject(_User.USER_KEY, user.toJson());
      await LocalStorage.setString(TOKEN_KEY, json['jwtToken']);

      return;
    }

    throw CustomException('Deu algum erro!');
  }

  Future<void> createAccount(NewAccountModel newAccount) async {
    _http.post(
      'usuario',
      body: newAccount.toJson(),
    );
  }

  Future<void> changePassword(String username, String newPassword) async {
    _http.post(
      'usuario/mudar-senha',
      body: {
        'username': username,
        'newPassword': newPassword,
      },
    );
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

  String? get type => _user?._userType?.map((type) => type.type).join(',');

  bool isCreator() {
    return _user!._userType!.contains(UserType.creator);
  }

  bool isNotCreator() {
    return !isCreator();
  }

  bool isPlayer() {
    return _user!._userType!.contains(UserType.player);
  }

  bool isNotPlayer() {
    return !isPlayer();
  }
}
