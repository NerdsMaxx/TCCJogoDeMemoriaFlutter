import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/components/card_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/card_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_adding_model.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class CardsEditingComponent extends StatefulWidget {
  const CardsEditingComponent({super.key});

  @override
  State<CardsEditingComponent> createState() => _CardsEditingComponentState();
}

class _CardsEditingComponentState extends State<CardsEditingComponent> {
  late final CardEditingModel cardEditing1;
  late final CardEditingModel cardEditing2;

  @override
  Widget build(BuildContext context) {
    cardEditing1 = CardEditingContext.of(context)!.card!;
    cardEditing2 = cardEditing1.otherCard;

    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(
            width: 8,
          ),
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CardEditingComponent(
                  cardEditing: cardEditing1,
                  isFirst: cardEditing1 is CardAddingModel,
                ),
                const SizedBox(
                  width: 20,
                ),
                CardEditingComponent(
                  cardEditing: cardEditing2,
                  isFirst: cardEditing2 is CardAddingModel,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                CardEditingContext.addCardsIfNotExistsFromContext(
                    context, cardEditing1);
                debugPrint(CardEditingContext.getCardListFromContext(context)!
                    .map((e) => e.content.toString())
                    .toString());
                CardEditingContext.clearCard(context);
              },
              child: const Text('Aplicar alteração'),
            ),
          ],
        ),
      ),
    );
  }
}
