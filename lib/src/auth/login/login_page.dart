import 'package:flutter/material.dart';
import 'package:memory_game_web/src/auth/login/login_controller.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';

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
                        TextFormField(
                          validator: _controller.validatorUsernameOrEmail,
                          onChanged: (value) => _controller.username = value,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: _controller.validatorPassword,
                          obscureText: true,
                          autocorrect: false,
                          onChanged: (value) => _controller.password = value,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  ElevatedButton(
                    onPressed: _controller.onPressed(context),
                    child: const Text('Logar'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
