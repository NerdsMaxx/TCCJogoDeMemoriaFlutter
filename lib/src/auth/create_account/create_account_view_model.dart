import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/auth/models/new_account_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';

class CreateAccountViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String username = '';
  String email = '';
  String password = '';
  bool isCreator = false;
  bool isPlayer = false;

  List<bool> isSelected = [true, false];
  final ValueNotifier<bool> changeToggleButton = ValueNotifier(false);

  final Auth _auth = getIt<Auth>();

  final validatorName = ValidationBuilder(requiredMessage: 'Obrigatório colocar nome.')
      .minLength(2, 'Nome tem que ter pelo menos dois caracteres')
      .build();

  final validatorEmail = ValidationBuilder(requiredMessage: 'Obrigatório colocar e-mail.')
      .email('Não está no formato de e-mail.')
      .build();

  final validatorUsername = ValidationBuilder(requiredMessage: 'É obrigatório preencher usuário.')
      .minLength(5, 'Nome de usuário deve ser no mínimo 5 caracteres')
      .build();

  final validatorPassword = ValidationBuilder(requiredMessage: 'É obrigatório preencher a senha.')
      .minLength(6, 'Senha deve ter no mínimo 6 caracteres')
      .build();

  void onPressedButton(int index) {
    isSelected[index] = true;

    if (index == 0) {
      isPlayer = true;
    }

    if (index == 1) {
      isCreator = true;
    }

    changeToggleButton.value = !changeToggleButton.value;
  }

  VoidCallback onPressedCreateAccount(BuildContext context) {
    return () async {
      if (!formKey.currentState!.validate()) {
        return;
      }

      List<String> types = [];
      if(isPlayer) {
        types.add('JOGADOR');
      }

      if(isCreator) {
        types.add('CRIADOR');
      }

      NewAccountModel newAccount = NewAccountModel(
        name: name,
        username: username,
        email: email,
        password: password,
        types: types,
      );

      await _auth.createAccount(newAccount);

      if (context.mounted) {
        context.router.popUntilRoot();
      }
    };
  }
}
