import 'package:flutter/material.dart';
import 'package:memory_game_web/src/auth/login/login_controller.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Form(
            key: _controller.formKey,
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
                          validator: _controller.validatorUsernameOrEmail,
                          onChanged: (value) => _controller.username = value,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFieldFormWidget(
                          hintText: 'Senha',
                          validator: _controller.validatorPassword,
                          obscureText: true,
                          autocorrect: false,
                          onChanged: (value) => _controller.password = value,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  ElevatedButton(
                    onPressed: _controller.onPressedLogin(context),
                    child: const Text('Logar'),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _controller.onPressedCreateAccount(context),
            child: const Text('Cadastrar a conta'),
          ),
        ],
      ),
    );
  }
}
