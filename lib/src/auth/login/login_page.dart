import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';

part 'login_logic.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _LoginLogic _logic = _LoginLogic();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Form(
            key: _logic.formKey,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: _logic.validatorUsernameOrEmail,
                          onChanged: (value) => _logic.username = value,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: _logic.validatorPassword,
                          obscureText: true,
                          autocorrect: false,
                          onChanged: (value) => _logic.password = value,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  ElevatedButton(
                    onPressed: _logic.onPressed(context),
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
