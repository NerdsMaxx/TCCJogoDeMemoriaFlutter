part of 'login_page.dart';

class _LoginLogic {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  final Auth _auth = getIt<Auth>();

  final validatorUsernameOrEmail =
      ValidationBuilder(requiredMessage: 'É obrigatório preencher usuário.')
          .minLength(5, 'Nome de usuário deve ser no mínimo 5 caracteres')
          .build();

  final validatorPassword = ValidationBuilder(requiredMessage: 'É obrigatório preencher a senha.')
      .minLength(6, 'Senha deve ter no mínimo 6 caracteres')
      .build();

  Future<bool> doLogin() async {
    await _auth.login(username, password);
    return _auth.isValid();
  }

  onPressed(BuildContext context) {
    return () async {
      if (formKey.currentState!.validate()) {
        if (await doLogin()) {
          context.router.pushNamed('/dashboard');
        }
      }
    };
  }
}
