import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/inherited_widgets/cards_grid_inherited.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

class CreateOrEditCardFirstStepComp extends StatelessWidget {
  const CreateOrEditCardFirstStepComp({
    required super.key,
    this.card,
  });

  final CardModel? card;

  @override
  Widget build(BuildContext context) {
    final String text = card?.phrase ?? '+';
    double fontSize = (card != null) ? 26 : 64;

    ValueNotifier<bool> showCreation = CardsGridInherited.of(context).showCreation;

    return CustomCardComp(
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
            if (card!.typeCard == TypeCard.question) {
              CardsGridInherited.of(context).cardQuestion.value = card;
              CardsGridInherited.of(context).cardAnswer.value = card!.otherCard;
            } else {
              CardsGridInherited.of(context).cardAnswer.value = card;
              CardsGridInherited.of(context).cardQuestion.value = card!.otherCard;
            }
          } else {
            CardsGridInherited.of(context).cardQuestion.value =
                CardModel(typeCard: TypeCard.question);
            CardsGridInherited.of(context).cardAnswer.value = CardModel(typeCard: TypeCard.answer);
          }

          showCreation.value = !showCreation.value;
        },
      ),
    );
  }
}
