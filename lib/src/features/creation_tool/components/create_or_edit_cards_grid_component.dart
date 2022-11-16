import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar_component.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit_card_first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit_two_cards_second_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/inherited_widgets/cards_grid_inherited.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/utils/simple_object_util.dart';
import 'package:jogo_de_memoria_flutter/src/utils/size_util.dart';

class CreateOrEditCardsGridComponent extends StatefulWidget {
  const CreateOrEditCardsGridComponent({super.key});

  @override
  State<CreateOrEditCardsGridComponent> createState() => _CreateOrEditCardsGridComponentState();
}

class _CreateOrEditCardsGridComponentState extends State<CreateOrEditCardsGridComponent> {
  final ValueNotifier<bool> _showCreation = ValueNotifier(false);
  final List<Widget> _cardsWidget = List.empty(growable: true);

  SimpleObjectUtil<CardModel> cardQuestion =
      SimpleObjectUtil(CardModel(typeCard: TypeCard.question));

  SimpleObjectUtil<CardModel> cardAnswer = SimpleObjectUtil(CardModel(typeCard: TypeCard.answer));

  @override
  Widget build(BuildContext context) {
    return CustomAppBarComp(
      body: CardsGridInherited(
        cardsWidget: _cardsWidget,
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
                        CreateOrEditCardFirstStepComp(
                          key: UniqueKey(),
                        ),
                        ..._cardsWidget,
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: showCreation,
                child: CreateOrEditTwoCardsSecondStepComp(
                  cardAnswer: cardAnswer.value!..otherCard = cardQuestion.value,
                  cardQuestion: cardQuestion.value!..otherCard = cardAnswer.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
