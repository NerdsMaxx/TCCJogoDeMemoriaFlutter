import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/components/card_editing/card_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/card_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_adding_model.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';

part 'cards_editing_component_logic.dart';

class CardsEditingComponent extends StatelessWidget {
  const CardsEditingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final _CardsEditingComponentLogic logic = _CardsEditingComponentLogic(context);

    return Center(
      child: CustomContainerWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CardEditingComponent(
                  cardEditing: logic.cardEditing1,
                  isFirst: logic.cardEditing1 is CardAddingModel,
                ),
                const SizedBox(
                  width: 20,
                ),
                CardEditingComponent(
                  cardEditing: logic.cardEditing2,
                  isFirst: logic.cardEditing2 is CardAddingModel,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: logic.onPressedApplyChange(context),
              child: const Text('Aplicar alteração'),
            ),
          ],
        ),
      ),
    );
  }
}
