import 'package:flutter/material.dart';
import 'package:memory_game_web/src/auth/create_account/create_account_controller.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final CreateAccountController controller = CreateAccountController();

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
                key: controller.formKey,
                child: SizedBox(
                  width: 500,
                  child: Column(
                    children: [
                      CustomTextFieldFormWidget(
                        hintText: 'Nome',
                        validator: controller.validatorName,
                        onChanged: (value) => controller.name = value,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFieldFormWidget(
                        hintText: 'Usuário',
                        validator: controller.validatorUsername,
                        onChanged: (value) => controller.username = value,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFieldFormWidget(
                        hintText: 'E-mail',
                        validator: controller.validatorEmail,
                        onChanged: (value) => controller.email = value,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFieldFormWidget(
                        hintText: 'Senha',
                        validator: controller.validatorPassword,
                        autocorrect: false,
                        onChanged: (value) => controller.password = value,
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
                              valueListenable: controller.changeToggleButton,
                              builder: (context, _, __) => ToggleButtons(
                                isSelected: controller.isSelected,
                                onPressed: controller.onPressedButton,
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
                        onPressed: controller.onPressedCreateAccount(context),
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
