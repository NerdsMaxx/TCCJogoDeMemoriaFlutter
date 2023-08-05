import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/auth/change_password/change_password_view_model.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

@RoutePage(name: 'ChangePasswordRoute')
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final ChangePasswordViewModel viewModel = ChangePasswordViewModel();

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
                key: viewModel.formKey,
                child: SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      CustomTextFieldFormWidget(
                        hintText: 'Usuário',
                        validator: viewModel.validatorUsername,
                        onChanged: (value) => viewModel.username = value,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFieldFormWidget(
                        hintText: 'Senha',
                        validator: viewModel.validatorPassword,
                        autocorrect: false,
                        obscureText: true,
                        onChanged: (value) => viewModel.password = value,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFieldFormWidget(
                        hintText: 'Confirmação de senha',
                        validator: viewModel.validatorPassword,
                        autocorrect: false,
                        obscureText: true,
                        onChanged: (value) => viewModel.confirmPassword = value,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: viewModel.onPressedChangePassword(context),
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