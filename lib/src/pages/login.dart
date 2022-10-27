import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Jogo de memória',
              style: GoogleFonts.pacifico(
                fontSize: 46,
                color: const Color(0xff342f27),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 850,
              ),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: TextFormField(
                  autocorrect: false,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
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
                  autocorrect: false,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Senha',
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
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff342f27),
                ),
                child: Text(
                  'Logar',
                  style: GoogleFonts.pacifico(fontSize: 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
