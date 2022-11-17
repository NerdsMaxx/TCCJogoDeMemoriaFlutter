import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/colors/colors_palette.dart';
import 'package:jogo_de_memoria_flutter/src/components/create_button_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/edit_button_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit_a_card_third_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit_card_first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/inherited_widgets/cards_grid_inherited.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/utils/snackbar_util.dart';

class CreateOrEditTwoCardsSecondStepComp extends StatelessWidget {
  const CreateOrEditTwoCardsSecondStepComp({
    super.key,
    required this.cardQuestion,
    required this.cardAnswer,
  });

  final CardModel cardQuestion;
  final CardModel cardAnswer;

  VoidCallback _onPressed(BuildContext context) {
    return () {
      final String phraseQuestion = cardQuestion.phrase;
      final String phraseAnswer = cardAnswer.phrase;

      if (phraseQuestion.isEmpty) {
        showSnackBar(context, "Faltou criar carta de pergunta.");
        return;
      }

      if (phraseAnswer.isEmpty) {
        showSnackBar(context, "Faltou criar carta de resposta.");
        return;
      }

      List<Widget> cardsWidget = CardsGridInherited.of(context).cardsWidget;

      Widget cardQuestionWidget = CreateOrEditCardFirstStepComp(
        key: cardQuestion.id,
        card: cardQuestion,
      );

      Widget cardAnswerWidget = CreateOrEditCardFirstStepComp(
        key: cardAnswer.id,
        card: cardAnswer,
      );

      if (cardsWidget.any((card) => card.key! == cardQuestionWidget.key!)) {
        cardsWidget.removeWhere((cardWidget) => cardWidget.key == cardQuestionWidget.key);
        cardsWidget.removeWhere((cardWidget) => cardWidget.key == cardAnswerWidget.key);
      }

      cardsWidget.addAll([
        cardQuestionWidget,
        cardAnswerWidget,
      ]);

      CardsGridInherited.of(context).showCreation.value = false;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
              color: ColorsPalette.colorDefault.shade400,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: ColorsPalette.colorDefault,
                width: 10.0,
              )),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _CardCreation(
                    text: 'Pergunta',
                    card: cardQuestion,
                  ),
                  const SizedBox(width: 30),
                  _CardCreation(
                    text: 'Resposta',
                    card: cardAnswer,
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Visibility(
                visible: cardAnswer.phrase.isEmpty && cardQuestion.phrase.isEmpty,
                // ignore: sort_child_properties_last
                child: CreateButtonComp(
                  onPressed: _onPressed(context),
                ),
                replacement: EditButtonComp(
                  onPressed: _onPressed(context),
                ),
              ),
            ],
          )),
    );
  }
}

class _CardCreation extends StatelessWidget {
  const _CardCreation({
    super.key,
    required this.text,
    required this.card,
  });

  final String text;
  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelectableText(
          text,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CreateOrEditACardThirdStepComp(
          card: card,
        ),
      ],
    );
  }
}
