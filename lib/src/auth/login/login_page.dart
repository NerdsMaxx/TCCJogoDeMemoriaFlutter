import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/auth/login/login_view_model.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

@RoutePage(name: 'LoginRoute')
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Form(
            key: viewModel.formKey,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: Column(
                      children: [
                        CustomTextFieldFormWidget(
                          hintText: 'Usuário',
                          validator: viewModel.validatorUsername,
                          onChanged: (value) => viewModel.username = value,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFieldFormWidget(
                          hintText: 'Senha',
                          validator: viewModel.validatorPassword,
                          obscureText: true,
                          autocorrect: false,
                          onChanged: (value) => viewModel.password = value,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  ElevatedButton(
                    onPressed: viewModel.onPressedLogin(context),
                    child: const Text('Logar'),
                  ),
                  const SizedBox(
                    height: 85,
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: viewModel.onPressedCreateAccount(context),
            child: const Text(
              'Não tem conta? Cadastre a sua conta agora.',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: viewModel.onPressedChangePassword(context),
            child: const Text(
              'Esqueceu a senha? Altere a senha.',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

