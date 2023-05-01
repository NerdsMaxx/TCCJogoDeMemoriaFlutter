import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/utils/snack_bar_util.dart';
import 'package:memory_game_web/src/widgets/custom_snack_bar_widget.dart';

class LoginViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  final Auth _auth = getIt<Auth>();

  final validatorUsername = ValidationBuilder(requiredMessage: 'É obrigatório preencher usuário.')
      .minLength(5, 'Nome de usuário deve ter no mínimo 5 caracteres')
      .build();

  final validatorPassword = ValidationBuilder(requiredMessage: 'É obrigatório preencher a senha.')
      .minLength(6, 'Senha deve ter no mínimo 6 caracteres')
      .build();

  Future<bool> doLogin() async {
    await _auth.login(username, password);
    return _auth.isValid();
  }

  VoidCallback onPressedLogin(BuildContext context) {
    return () async {
      if (formKey.currentState!.validate()) {
        try {
          await doLogin();

          if (context.mounted) {
            context.router.push(const DashboardRoute());
          }
        } catch (e) {
          if (e is CustomException) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              SnackBarUtil.showSnackBar(
                context,
                CustomSnackBarWidget.forError(e.message),
              );
            });
          }
        }
      }
    };
  }

  VoidCallback onPressedCreateAccount(BuildContext context) {
    return () {
      context.router.push(
        const CreateAccountRoute(),
      );
    };
  }

  VoidCallback onPressedChangePassword(BuildContext context) {
    return () {
      context.router.push(
        const ChangePasswordRoute(),
      );
    };
  }
}
