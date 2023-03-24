import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

part 'change_password_page_logic.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _ChangePasswordPageLogic logic = _ChangePasswordPageLogic();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: Center(
        child: Column(
          children: [
            SelectableText(
              'Alterar a senha',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 45,
            ),
            Form(
                key: logic.formKey,
                child: SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      CustomTextFieldFormWidget(
                        hintText: 'Usuário',
                        validator: logic.validatorUsername,
                        onChanged: (value) => logic.username = value,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFieldFormWidget(
                        hintText: 'Senha',
                        validator: logic.validatorPassword,
                        autocorrect: false,
                        onChanged: (value) => logic.password = value,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: logic.onPressedChangePassword(context),
                        child: const Text('Alterar'),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
