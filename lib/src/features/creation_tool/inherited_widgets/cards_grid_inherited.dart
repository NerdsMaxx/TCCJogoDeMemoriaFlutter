import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';


class CardsGridInherited extends InheritedWidget {
  CardsGridInherited({
    super.key,
    required this.cardsWidget,
    required this.showCreation,
    required this.cardQuestion,
    required this.cardAnswer,
    required super.child,
  });

  final List<Widget> cardsWidget;
  ValueNotifier<bool> showCreation;
  CardModel cardQuestion;
  CardModel cardAnswer;

  static CardsGridInherited of(BuildContext context) {
    final CardsGridInherited? result =
        context.dependOnInheritedWidgetOfExactType<CardsGridInherited>();
    assert(result != null, 'CardsGridInherited não foi encontrado no contexto.');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant CardsGridInherited oldWidget) => false;
}
