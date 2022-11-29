import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/models/simple_object_model.dart';

// ignore: must_be_immutable
class CardsGridContext extends InheritedWidget {
  CardsGridContext({
    super.key,
    required this.cardsWidget,
    required this.showCreation,
    required this.cardQuestion,
    required this.cardAnswer,
    required super.child,
  });

  final List<CreateOrEditCardFirstStepComponent> cardsWidget;
  ValueNotifier<bool> showCreation;
  SimpleObjectModel<CardModel> cardQuestion;
  SimpleObjectModel<CardModel> cardAnswer;

  static CardsGridContext of(BuildContext context) {
    final CardsGridContext? result = context.dependOnInheritedWidgetOfExactType<CardsGridContext>();
    assert(result != null, 'CardsGridInherited não foi encontrado no contexto.');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant CardsGridContext oldWidget) => false;
}
