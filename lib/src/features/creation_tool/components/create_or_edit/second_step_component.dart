import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/create_button_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_container_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/edit_button_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/third_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/context/cards_grid_context.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/utils/snackbar_util.dart';

class CreateOrEditTwoCardsSecondStepComponent extends StatelessWidget {
  const CreateOrEditTwoCardsSecondStepComponent({
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

      List<CreateOrEditCardFirstStepComponent> cardsWidget =
          CardsGridContext.of(context).cardsWidget;

      CreateOrEditCardFirstStepComponent cardQuestionWidget = CreateOrEditCardFirstStepComponent(
        key: cardQuestion.id,
        card: cardQuestion,
      );

      CreateOrEditCardFirstStepComponent cardAnswerWidget = CreateOrEditCardFirstStepComponent(
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

      CardsGridContext.of(context).showCreation.value = false;
    };
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainerComponent(
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
            child: CreateButtonComponent(
              onPressed: _onPressed(context),
            ),
            replacement: EditButtonComponent(
              onPressed: _onPressed(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _CardCreation extends StatelessWidget {
  const _CardCreation({
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
