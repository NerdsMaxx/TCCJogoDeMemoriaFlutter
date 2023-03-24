part of 'change_password_page.dart';

class _ChangePasswordPageLogic {
  final Auth auth = getIt<Auth>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';

  final validatorUsername = ValidationBuilder(requiredMessage: 'É obrigatório preencher usuário.')
      .minLength(5, 'Nome de usuário deve ser no mínimo 5 caracteres')
      .build();

  final validatorPassword = ValidationBuilder(requiredMessage: 'É obrigatório preencher a senha.')
      .minLength(6, 'Senha deve ter no mínimo 6 caracteres')
      .build();

  VoidCallback onPressedChangePassword(BuildContext context) {
    return () async {
      await auth.changePassword(username, password);

      if(context.mounted) {
        context.router.push(const InitialRoute());
      }
    };
  }
}
