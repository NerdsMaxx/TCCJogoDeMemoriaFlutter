import 'package:flutter/material.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';

class SizeUtil {
  SizeUtil._();

  static double width(BuildContext context, double minimum, double factor) {
    double width = MediaQuery.of(context).size.width;

    if (factor > 1.0) {
      throw CustomException('Não é permitido fator acima de 1.0!');
    }

    return width > minimum ? width * factor : minimum;
  }

  static double height(BuildContext context, double minimum, double factor) {
    double height = MediaQuery.of(context).size.height;

    if (factor > 1.0) {
      throw CustomException('Não é permitido fator acima de 1.0!');
    }

    return height > minimum ? height * factor : minimum;
  }

  static double heightFactor(BuildContext context, double factor) {
    if (factor > 1.0) {
      throw CustomException('Não é permitido fator acima de 1.0!');
    }

    return MediaQuery.of(context).size.height * factor;
  }
}
