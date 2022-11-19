import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit_card_first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/utils/simple_object_util.dart';

// ignore: must_be_immutable
class CardsGridInherited extends InheritedWidget {
  CardsGridInherited({
    super.key,
    required this.cardsWidget,
    required this.showCreation,
    required this.cardQuestion,
    required this.cardAnswer,
    required super.child,
  });

  final List<CreateOrEditCardFirstStepComp> cardsWidget;
  ValueNotifier<bool> showCreation;
  SimpleObjectUtil<CardModel> cardQuestion;
  SimpleObjectUtil<CardModel> cardAnswer;

  static CardsGridInherited of(BuildContext context) {
    final CardsGridInherited? result =
        context.dependOnInheritedWidgetOfExactType<CardsGridInherited>();
    assert(result != null, 'CardsGridInherited não foi encontrado no contexto.');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant CardsGridInherited oldWidget) => false;
}
