import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/utils/snack_bar_util.dart';
import 'package:memory_game_web/src/widgets/custom_snack_bar_widget.dart';

class ChangePasswordViewModel {
  final Auth auth = getIt<Auth>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';
  String confirmPassword = '';

  final validatorUsername =
      ValidationBuilder(requiredMessage: 'É obrigatório preencher usuário.')
          .minLength(5, 'Nome de usuário deve ser no mínimo 5 caracteres')
          .build();

  final validatorPassword =
      ValidationBuilder(requiredMessage: 'É obrigatório preencher a senha.')
          .minLength(6, 'Senha deve ter no mínimo 6 caracteres')
          .build();

  VoidCallback onPressedChangePassword(BuildContext context) {
    return () async {
      try {
        if(password != confirmPassword) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            SnackBarUtil.showSnackBar(
              context,
              CustomSnackBarWidget.forError("A nova senha não é a mesma da confirmação!"),
            );
          });

          return;
        }

        await auth.changePassword(username, password);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          SnackBarUtil.showSnackBar(
            context,
            CustomSnackBarWidget.forSucess("Alteração de senha feita! Logue novamente!"),
          );
        });

        if (context.mounted) {
          context.router.push(const InitialRoute());
        }
      } on CustomException catch (customException) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          SnackBarUtil.showSnackBar(
            context,
            CustomSnackBarWidget.forError(customException.toString()),
          );
        });
      }
    };
  }
}