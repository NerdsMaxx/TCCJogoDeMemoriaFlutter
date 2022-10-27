import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jogo_de_memoria_flutter/src/pages/creation_tool.dart';
import 'package:jogo_de_memoria_flutter/src/pages/login.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  

  OutlineInputBorder get _outlineInputBorder => const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(
          color: Color(0xff342f27),
          width: 5,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jogo de Memória',
        theme: ThemeData(
          primaryColor: Colors.white,
          // inputDecorationTheme: InputDecorationTheme(
          //   enabledBorder: _outlineInputBorder,
          //   focusedBorder: _outlineInputBorder,
          // ),
          backgroundColor: const Color(0xff342f27),
        ),
        home: const CreationTool(),
      ),
    );
  }
}
