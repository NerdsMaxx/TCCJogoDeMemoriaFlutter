import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

final themeLight = ThemeData(
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: _lightColorScheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(180, 60),
      textStyle: const TextStyle(
        fontSize: 22,
      ),
    ),
  ),
);

final themeDark = ThemeData(
  useMaterial3: true,
  colorScheme: _darkColorScheme,
);
