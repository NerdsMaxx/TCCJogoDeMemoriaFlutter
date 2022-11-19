import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit_card_first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

class CardDashboardComp extends StatelessWidget {
  const CardDashboardComp({
    super.key,
    required this.name,
    required this.memoryGameList,
  });

  final String name;
  final List memoryGameList;

  @override
  Widget build(BuildContext context) {
    const double sizeFactor = 0.6;

    return GestureDetector(
      child: SizedBox(
        width: 240 * sizeFactor,
        child: Column(
          children: [
            SizedBox(
              height: 340 * sizeFactor,
              child: Stack(
                children: const [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomCardComp(
                      sizeFactor: sizeFactor,
                      child: SizedBox.shrink(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomCardComp(
                      sizeFactor: sizeFactor,
                      child: SizedBox.shrink(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomCardComp(
                      sizeFactor: sizeFactor,
                      child: SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SelectableText(
              name,
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        final List cards = memoryGameList.where((memoryGame) {
          if (memoryGame['name'] != null && memoryGame['name']!  == name) {
            return true;
          }

          return false;
        }).map((memoryGame) {
          if (memoryGame['cards'] is Map<String, String>) {
            return memoryGame['cards'];
          }

          return {'': ''};
        }).toList();

        List<CreateOrEditCardFirstStepComp>? cardsWidget = List.empty(growable: true);

        for (var card in cards) {
          String questionPhrase;
          String answerPhrase;

          if (card['question'] is String && card['answer'] is String) {
            questionPhrase = card['question']!;
            CardModel question = CardModel(phrase: questionPhrase, typeCard: TypeCard.question);

            answerPhrase = card['answer']!;
            CardModel answer = CardModel(phrase: answerPhrase, typeCard: TypeCard.answer);

            cardsWidget.addAll([
              CreateOrEditCardFirstStepComp(
                key: question.id,
                card: question,
              ),
              CreateOrEditCardFirstStepComp(
                key: answer.id,
                card: answer,
              )
            ]);
          }
        }

        context.push('/creation_tool', extra: cardsWidget);
      },
    );
  }
}
