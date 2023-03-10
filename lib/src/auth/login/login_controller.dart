
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';

class LoginController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  final Auth _auth = getIt<Auth>();

  final validatorUsernameOrEmail =
      ValidationBuilder(requiredMessage: 'É obrigatório preencher usuário.')
          .minLength(5, 'Nome de usuário deve ser no mínimo 5 caracteres')
          .build();

  final validatorPassword = ValidationBuilder(requiredMessage: 'É obrigatório preencher a senha.')
      .minLength(6, 'Senha deve ter no mínimo 6 caracteres')
      .build();

  Future<bool> doLogin() async {
    await _auth.login(username, password);
    return _auth.isValid();
  }

  onPressed(BuildContext context) {
    return () async {
      if (formKey.currentState!.validate()) {
        if (await doLogin()) {
          context.router.pushNamed('/dashboard');
        }
      }
    };
  }
}
