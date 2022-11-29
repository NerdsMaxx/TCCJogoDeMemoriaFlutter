import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/auth/auth.dart';

// ignore: must_be_immutable
class AuthContext extends InheritedWidget {
  AuthContext({
    super.key,
    required this.auth,
    required super.child,
  });

  Auth auth;

  static AuthContext of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AuthContext>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
