import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/auth/create_account/create_account_view_model.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

@RoutePage(name: 'CreateAccountRoute')
class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final CreateAccountViewModel viewModel = CreateAccountViewModel();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: Center(
        child: Column(
          children: [
            SelectableText(
              'Cadastrar a sua conta',
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
                        hintText: 'Nome',
                        validator: viewModel.validatorName,
                        onChanged: (value) => viewModel.name = value,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
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
                        hintText: 'E-mail',
                        validator: viewModel.validatorEmail,
                        onChanged: (value) => viewModel.email = value,
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
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SelectableText(
                              'Tipo de usuário: ',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ValueListenableBuilder(
                              valueListenable: viewModel.changeToggleButton,
                              builder: (context, _, __) => ToggleButtons(
                                isSelected: viewModel.isSelected,
                                onPressed: viewModel.onPressedButton,
                                constraints: const BoxConstraints(
                                  minHeight: 40.0,
                                  minWidth: 100.0,
                                ),
                                children: const [
                                  Text(
                                    'Jogador',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    'Criador',
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: viewModel.onPressedCreateAccount(context),
                        child: const Text('Criar'),
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
