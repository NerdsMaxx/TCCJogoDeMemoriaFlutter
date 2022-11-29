import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/app/app.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  runApp(const App());
}
