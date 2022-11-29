import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:jogo_de_memoria_flutter/src/auth/auth.dart';
import 'package:jogo_de_memoria_flutter/src/utils/snackbar_util.dart';
import 'package:jogo_de_memoria_flutter/src/settings/widgets/custom_outline_input_border_setting.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  Auth? _auth;

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
                          if (value != null && value.length >= 4) {
                            return null;
                          }

                          return 'No mínimo 4 caracteres.';
                        },
                        onChanged: (value) => _username = value,
                        autocorrect: false,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Usuário',
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
                        onChanged: (value) => _password = value,
                        autocorrect: false,
                        obscureText: true,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Senha',
                          border: CustomOutlineInputBorderSetting(),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          http.Response response = await http.get(
                            Uri.parse('http://127.0.0.1:8080/user/$_username/$_password'),
                            headers: {
                              HttpHeaders.contentTypeHeader: 'application/json',
                              HttpHeaders.acceptLanguageHeader: 'pt-BR',
                            },
                          );

                          bool isValid = jsonDecode(response.body) as bool;

                          if (isValid) {
                            _auth = Auth(_username);
                            // ignore: use_build_context_synchronously
                            context.push('/dashboard', extra: _auth);
                            return;
                          }

                          // ignore: use_build_context_synchronously
                          showSnackBar(
                            context,
                            'Usuário/Senha errada.',
                          );
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
