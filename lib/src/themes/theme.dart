import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.flutterDash,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 9,
  subThemesData: FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    elevatedButtonTextStyle: MaterialStateProperty.resolveWith(
      (_) => const TextStyle(fontSize: 26),
    ),
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
);

final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.flutterDash,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 15,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
);
