import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/colors/colors_palette.dart';
import 'package:jogo_de_memoria_flutter/src/components/create_button_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit_a_card_third_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit_card_first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/inherited_widgets/cards_grid_inherited.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/utils/snackbar_util.dart';

class CreateOrEditTwoCardsSecondStepComp extends StatefulWidget {
  const CreateOrEditTwoCardsSecondStepComp({
    super.key,
    required this.cardQuestion,
    required this.cardAnswer,
  });

  final CardModel cardQuestion;
  final CardModel cardAnswer;

  @override
  State<CreateOrEditTwoCardsSecondStepComp> createState() =>
      _CreateOrEditTwoCardsSecondStepCompState();
}

class _CreateOrEditTwoCardsSecondStepCompState extends State<CreateOrEditTwoCardsSecondStepComp> {
  void _onPressed() {
    final String phraseQuestion = widget.cardQuestion.phrase;
    final String phraseAnswer = widget.cardAnswer.phrase;

    if (phraseQuestion.isEmpty) {
      showSnackBar(context, "Faltou criar carta de pergunta.");
      return;
    }

    if (phraseAnswer.isEmpty) {
      showSnackBar(context, "Faltou criar carta de resposta.");
      return;
    }

    List<Widget> cardsWidget = CardsGridInherited.of(context).cardsWidget;

    cardsWidget.addAll([
      CreateOrEditCardFirstStepComp(
        key: widget.cardQuestion.id,
        card: widget.cardQuestion,
      ),
      CreateOrEditCardFirstStepComp(
        key: widget.cardAnswer.id,
        card: widget.cardAnswer,
      ),
    ]);

    CardsGridInherited.of(context).showCreation.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            color: ColorsPalette.colorDefault.shade400,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CreateOrEditACardThirdStepComp(
                    card: widget.cardQuestion,
                  ),
                  const SizedBox(width: 25),
                  CreateOrEditACardThirdStepComp(
                    card: widget.cardAnswer,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              CreateButtonComp(
                onPressed: _onPressed,
              ),
            ],
          )),
    );
  }
}
