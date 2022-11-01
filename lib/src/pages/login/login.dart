import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jogo_de_memoria_flutter/src/configurations/custom_outline_input_border.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                            RegExp emailRegExp = RegExp(r'([a-zA-Z0-9]+)@[a-z]+\.[a-z]{2,3}');

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
                          border: CustomOutlineInputBorder(),
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
                          border: CustomOutlineInputBorder(),
                        ),
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
