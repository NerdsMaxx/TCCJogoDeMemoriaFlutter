import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/second_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/context/cards_grid_context.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/models/optional_model.dart';
import 'package:jogo_de_memoria_flutter/src/utils/size_util.dart';

class CreateOrEditCardsGridComponent extends StatefulWidget {
  const CreateOrEditCardsGridComponent({
    super.key,
    required this.cardsWidget,
  });

  final List<CreateOrEditCardFirstStepComponent> cardsWidget;

  @override
  State<CreateOrEditCardsGridComponent> createState() => _CreateOrEditCardsGridComponentState();
}

class _CreateOrEditCardsGridComponentState extends State<CreateOrEditCardsGridComponent> {
  final ValueNotifier<bool> _showCreation = ValueNotifier(false);

  final OptionalModel<CardModel> cardQuestion =
      OptionalModel(CardModel(typeCard: TypeCardEnum.question));

  final OptionalModel<CardModel> cardAnswer =
      OptionalModel(CardModel(typeCard: TypeCardEnum.answer));

  @override
  Widget build(BuildContext context) {
    return CardsGridContext(
      cardsWidget: widget.cardsWidget,
      showCreation: _showCreation,
      cardQuestion: cardQuestion,
      cardAnswer: cardAnswer,
      child: ValueListenableBuilder(
        valueListenable: _showCreation,
        builder: (context, showCreation, child) => Stack(
          children: [
            Center(
              child: SizedBox(
                width: getWidth(context, 0.9),
                height: getHeight(context, 0.7),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      CreateOrEditCardFirstStepComponent(
                        key: UniqueKey(),
                      ),
                      ...widget.cardsWidget,
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showCreation,
              child: CreateOrEditTwoCardsSecondStepComponent(
                cardAnswer: cardAnswer.value!..otherCard = cardQuestion.value,
                cardQuestion: cardQuestion.value!..otherCard = cardAnswer.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
