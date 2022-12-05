import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

import 'package:jogo_de_memoria_flutter/src/colors/colors_palette.dart';
import 'package:jogo_de_memoria_flutter/src/routes/route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

    return MaterialApp.router(
      routerConfig: routes,
      debugShowCheckedModeBanner: false,
      title: 'Jogo de Memória',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: const Color(0xff342f27),
        primarySwatch: ColorsPalette.colorDefault,
      ),
    );
  }
}
