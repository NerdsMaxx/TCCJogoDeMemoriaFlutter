import 'package:flutter/material.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/cards_editing/components/card_component.dart';
import 'package:memory_game_web/src/features/cards_editing/components/cards_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/card_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/controller/cards_adding_controller.dart';
import 'package:memory_game_web/src/features/cards_editing/controller/cards_editing_controller.dart';
import 'package:memory_game_web/src/features/cards_editing/models/memory_game_editing_model.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/features/cards_editing/components/show_cards_component.dart';

class CardsAddingPage extends StatefulWidget {
  const CardsAddingPage({
    super.key,
  });

  @override
  State<CardsAddingPage> createState() => _CardsAddingPageState();
}

class _CardsAddingPageState extends State<CardsAddingPage> {
  final CardsAddingController _controller = CardsAddingController();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: CardEditingContext(
        showEditableCard: _controller.showEditableCard,
        cardEditingList: _controller.cardEditingList,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              ValueListenableBuilder(
                valueListenable: _controller.showEditableCard,
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
