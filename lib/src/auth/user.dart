part of 'auth.dart';

class _User {
  String? _username;
  String? _email;
  List<UserType>? _userType;

  static const String USER_KEY = 'user';

  static _User? getCurrentUser() {
    final dynamic result = LocalStorage.getObject(USER_KEY);

    if (result != null) {
      final _User? user = fromJson(result);

      if (user != null && user._username != null && user._email != null && user._userType != null) {
        return user;
      }
    }

    return null;
  }

  Map<String, dynamic> toJson() {
    List<String> types = [];

    if (_userType!.contains(UserType.creator)) {
      types.add('CRIADOR');
    }

    if (_userType!.contains(UserType.player)) {
      types.add('JOGADOR');
    }

    return {
      'username': _username,
      'email': _email,
      'type': types.join(','),
    };
  }

  static _User? fromJson(Map<String, dynamic> json) {
    _User user = _User()
      .._username = json['username']
      .._email = json['email']
      .._userType = (json['type'] as List).map((type) => UserType.getUserType(type)!).toList();

    if (user._username != null && user._email != null && user._userType != null) {
      return user;
    }

    return null;
  }
}
