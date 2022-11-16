import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jogo_de_memoria_flutter/src/widget_settings/custom_outline_input_border_setting.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(
              'Jogo de memória',
              style: GoogleFonts.pacifico(
                fontSize: 46,
                color: const Color(0xff342f27),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 850,
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null) {
                            RegExp emailRegExp = RegExp(r'^[a-z0-9]+@[a-z]+\.[a-z]{2,3}');

                            if (emailRegExp.hasMatch(value)) {
                              return null;
                            }
                          }

                          return 'Tem que estar na forma de e-mail.';
                        },
                        autocorrect: false,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'E-mail',
                          border: CustomOutlineInputBorderSetting(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 850,
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: TextFormField(
                        validator: (value) {
                          if (value != null) {
                            if (value.length >= 6) {
                              return null;
                            }
                          }

                          return 'No mínimo 6 caracteres.';
                        },
                        autocorrect: false,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Senha',
                          border: CustomOutlineInputBorderSetting(),
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.go('/dashboard');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff342f27),
                      ),
                      child: Text(
                        'Logar',
                        style: GoogleFonts.pacifico(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
