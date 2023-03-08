part of 'auth.dart';

class _User {
  String? _username;
  String? _email;
  UserType? _userType;

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
    return {
      'username': _username,
      'email': _email,
      'type': _userType!.type,
    };
  }

  static _User? fromJson(Map<String, dynamic> json) {
    _User user = _User()
      .._username = json['username']
      .._email = json['email']
      .._userType = UserType.getUserType(json['type']);

    if (user._username != null && user._email != null && user._userType != null) {
      return user;
    }

    return null;
  }
}
