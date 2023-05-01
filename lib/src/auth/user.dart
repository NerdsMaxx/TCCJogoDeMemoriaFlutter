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
      .._email = json['email'];

    dynamic jsonType = json['type'];
    
    List<String> types = [];
    if (jsonType is List<dynamic>) {
      types = jsonType.cast<String>();
    } else if (jsonType is String) {
      types = jsonType.split(',');
    }
    
    if(types.isNotEmpty) {
      user._userType = types.map((e) => UserType.getUserType(e)!).toList();
    }
    
    if (user._username != null && user._email != null && user._userType != null) {
      return user;
    }

    return null;
  }
}
