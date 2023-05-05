import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/auth/models/new_account_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/utils/snack_bar_util.dart';
import 'package:memory_game_web/src/widgets/custom_snack_bar_widget.dart';

class CreateAccountViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String username = '';
  String email = '';
  String password = '';
  bool isCreator = false;
  bool isPlayer = true;

  List<bool> isSelected = [true, false];
  final ValueNotifier<bool> changeToggleButton = ValueNotifier(false);

  final Auth _auth = getIt<Auth>();

  final validatorName = ValidationBuilder(requiredMessage: 'Obrigatório colocar nome.')
      .minLength(6, 'Nome tem que ter pelo menos 6 caracteres')
      .build();

  final validatorEmail = ValidationBuilder(requiredMessage: 'Obrigatório colocar e-mail.')
      .email('Não está no formato de e-mail.')
      .build();

  final validatorUsername = ValidationBuilder(requiredMessage: 'É obrigatório preencher usuário.')
      .minLength(6, 'Nome de usuário deve ser no mínimo 5 caracteres')
      .build();

  final validatorPassword = ValidationBuilder(requiredMessage: 'É obrigatório preencher a senha.')
      .minLength(6, 'Senha deve ter no mínimo 6 caracteres')
      .build();

  void onPressedButton(int index) {
    isSelected[index] = !isSelected[index];

    if (index == 0) {
      isPlayer = !isPlayer;
    }

    if (index == 1) {
      isCreator = !isCreator;
    }

    changeToggleButton.value = !changeToggleButton.value;
  }

  VoidCallback onPressedCreateAccount(BuildContext context) {
    return () async {
      if (!formKey.currentState!.validate()) {
        return;
      }

      if (!isPlayer && !isCreator) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          SnackBarUtil.showSnackBar(
            context,
            CustomSnackBarWidget.forError('Deve selecionar um tipo!'),
          );
        });

        return;
      }

      List<String> types = [];
      if (isPlayer) {
        types.add('JOGADOR');
      }

      if (isCreator) {
        types.add('CRIADOR');
      }

      NewAccountModel newAccount = NewAccountModel(
        name: name,
        username: username,
        email: email,
        password: password,
        type: types,
      );

      await _auth.createAccount(newAccount);

      if (context.mounted) {
        context.router.push(const InitialRoute());
      }
    };
  }
}
