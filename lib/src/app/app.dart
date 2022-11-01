import 'package:flutter/material.dart';

import 'package:jogo_de_memoria_flutter/src/configurations/palette.dart';
import 'package:jogo_de_memoria_flutter/src/routes/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
      title: 'Jogo de Memória',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: const Color(0xff342f27),
        primarySwatch: Palette.colorDefault,
      ),
    );
  }
}
