import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

class CardDashboardComponent extends StatelessWidget {
  const CardDashboardComponent({
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
        child: SizedBox(
          height: 340 * sizeFactor,
          child: CustomCardComponent(
            sizeFactor: sizeFactor,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        final List cards = memoryGameList.firstWhere(
            (memoryGame) => memoryGame['name'] != null && memoryGame['name']! == name)['cards']!;

        List<CreateOrEditCardFirstStepComponent>? cardsWidget = [];

        for (var card in cards) {
          String questionPhrase;
          String answerPhrase;

          if (card['question'] is String && card['answer'] is String) {
            questionPhrase = card['question']!;
            CardModel question = CardModel(phrase: questionPhrase, typeCard: TypeCardEnum.question);

            answerPhrase = card['answer']!;
            CardModel answer = CardModel(phrase: answerPhrase, typeCard: TypeCardEnum.answer);

            question.otherCard = answer;
            answer.otherCard = question;

            cardsWidget.addAll([
              CreateOrEditCardFirstStepComponent(
                key: question.id,
                card: question,
              ),
              CreateOrEditCardFirstStepComponent(
                key: answer.id,
                card: answer,
              )
            ]);
          }
        }

        context.go(
          '/creation_tool',
          extra: cardsWidget,
        );
      },
    );
  }
}
