import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/inherited_widgets/cards_grid_inherited.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

class CreateOrEditCardFirstStepComp extends StatelessWidget {
  const CreateOrEditCardFirstStepComp({
    super.key,
    this.card,
  });

  final CardModel? card;

  @override
  Widget build(BuildContext context) {
    final String text = card?.phrase ?? '+';
    double fontSize = (card != null) ? 26 : 64;

    ValueNotifier<bool> showCreation = CardsGridInherited.of(context).showCreation;

    Key key = card?.id ?? UniqueKey();

    return CustomCardComp(
      key: key,
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
        onPressed: () => showCreation.value = !showCreation.value,
      ),
    );
  }
}
