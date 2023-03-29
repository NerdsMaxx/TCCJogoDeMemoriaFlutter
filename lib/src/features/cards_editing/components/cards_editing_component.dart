import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/components/card_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/view_model/cards_editing_view_model.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';

class CardsEditingComponent extends StatelessWidget {
  const CardsEditingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final CardsEditingViewModel viewModel = CardsEditingViewModel(context);

    return Center(
      child: CustomContainerWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CardEditingComponent(
                  cardEditing: viewModel.cardEditing1,
                ),
                const SizedBox(
                  width: 20,
                ),
                CardEditingComponent(
                  cardEditing: viewModel.cardEditing2,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: viewModel.onPressedApplyChange,
              child: const Text('Aplicar alteração'),
            ),
          ],
        ),
      ),
    );
  }
}
