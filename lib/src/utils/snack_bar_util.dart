import 'package:flutter/material.dart';

class SnackBarUtil {
  _SnackBarUtil() {}

  static void showSnackBar(
    BuildContext context,
    SnackBar snackBar,
  ) {
    final ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);

    scaffoldMessenger.clearSnackBars();
    scaffoldMessenger.showSnackBar(snackBar);
  }
}
