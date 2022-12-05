import 'package:flutter/material.dart';

class FaceCardCountNotifier extends ChangeNotifier {
  FaceCardCountNotifier(this._value);

  int _value;

  set value(int newValue) {
    _value = newValue;
    notifyListeners();
  }

  set valueWithoutNotifying(int newValue) {
    _value = newValue;
  }

  int get value => _value;
}
