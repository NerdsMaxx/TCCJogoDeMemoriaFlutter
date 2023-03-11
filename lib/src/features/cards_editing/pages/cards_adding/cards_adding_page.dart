import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/components/cards_editing/cards_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/card_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/features/cards_editing/components/show_cards_component.dart';

part 'cards_adding_logic.dart';

class CardsAddingPage extends StatefulWidget {
  const CardsAddingPage({
    super.key,
  });

  @override
  State<CardsAddingPage> createState() => _CardsAddingPageState();
}

class _CardsAddingPageState extends State<CardsAddingPage> {
  final _CardsAddingLogic logic = _CardsAddingLogic();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: CardEditingContext(
        showEditableCard: logic.showEditableCard,
        cardEditingList: logic.cardEditingList,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              ValueListenableBuilder(
                valueListenable: logic.showEditableCard,
                builder: (context, showCardsEditing, _) => Stack(
                  children: [
                    ShowCardsComponent(), //não pode ser constante, pois senão não vai atualizar
                    Visibility(
                      visible: showCardsEditing,
                      child: const CardsEditingComponent(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}