import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/context/cards_grid_context.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

class CreateOrEditCardFirstStepComponent extends StatelessWidget {
  const CreateOrEditCardFirstStepComponent({
    required super.key,
    this.card,
  });

  final CardModel? card;

  @override
  Widget build(BuildContext context) {
    final String text = card?.phrase ?? '+';
    double fontSize = (card != null) ? 26 : 64;

    ValueNotifier<bool> showCreation = CardsGridContext.of(context).showCreation;

    return CustomCardComponent(
      key: key,
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
        onPressed: () {
          if (card != null) {
            if (card!.typeCard == TypeCardEnum.question) {
              CardsGridContext.of(context).cardQuestion.value = card;
              CardsGridContext.of(context).cardAnswer.value = card!.otherCard;
            } else {
              CardsGridContext.of(context).cardAnswer.value = card;
              CardsGridContext.of(context).cardQuestion.value = card!.otherCard;
            }
          } else {
            CardsGridContext.of(context).cardQuestion.value =
                CardModel(typeCard: TypeCardEnum.question);
            CardsGridContext.of(context).cardAnswer.value =
                CardModel(typeCard: TypeCardEnum.answer);
          }

          showCreation.value = !showCreation.value;
        },
      ),
    );
  }
}
