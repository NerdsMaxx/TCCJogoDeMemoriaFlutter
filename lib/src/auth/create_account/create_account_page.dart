import 'package:flutter/material.dart';
import 'package:memory_game_web/src/auth/create_account/create_account_controller.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final CreateAccountController controller = CreateAccountController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: controller.validatorName,
                  onChanged: (value) => controller.name = value,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: controller.validatorUsername,
                  onChanged: (value) => controller.username = value,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: controller.validatorEmail,
                  onChanged: (value) => controller.email = value,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  validator: controller.validatorPassword,
                  autocorrect: false,
                  onChanged: (value) => controller.password = value,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 30,
                ),
                ToggleButtons(
                  isSelected: controller.isSelected,
                  onPressed: controller.onPressedButton,
                  children: const [
                    Text('Jogador'),
                    Text('Criador'),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: controller.onPressedCreateAccount(context),
                  child: const Text('Criar'),
                ),
              ],
            )),
      ],
    );
  }
}
