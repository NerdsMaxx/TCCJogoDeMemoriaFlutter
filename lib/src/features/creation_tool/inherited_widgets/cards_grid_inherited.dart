import 'package:flutter/material.dart';

class CardsGridInherited extends InheritedWidget {
  const CardsGridInherited({
    super.key,
    required this.cardsWidget,
    required super.child,
  });

  final List<Widget> cardsWidget;

  static CardsGridInherited of(BuildContext context) {
    final CardsGridInherited? result =
        context.dependOnInheritedWidgetOfExactType<CardsGridInherited>();
    assert(result != null, 'CardsGridInherited não foi encontrado no contexto.');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
