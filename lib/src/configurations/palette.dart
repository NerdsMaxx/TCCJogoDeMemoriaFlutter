import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor colorDefault = MaterialColor(
    0xff342f27, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff48443d), //10%
      100: Color(0xff5d5952), //20%
      200: Color(0xff716d68), //30%
      300: Color(0xff85827d), //40%
      400: Color(0xff9a9793), //50%
      500: Color(0xffaeaca9), //60%
      600: Color(0xffc2c1be), //70%
      700: Color(0xffd6d5d4), //80%
      800: Color(0xffebeae9), //90%
      900: Color(0xffffffff), //100%
    },
  );
} // you can define define int 500 as the default shade and add yo
