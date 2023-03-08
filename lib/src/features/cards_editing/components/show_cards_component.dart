import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/components/card_adding_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/card_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';
import 'package:memory_game_web/src/features/cards_editing/components/card_component.dart';

class ShowCardsComponent extends StatelessWidget {
  ShowCardsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<CardEditingModel> cardList = CardEditingContext.getCardListFromContext(context)!;

    return Padding(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Wrap(
          spacing: 30,
          runSpacing: 30,
          children: cardList
              .map<Widget>(
                (card) => CardComponent(card: card),
              )
              .toList()
            ..add(const CardAddingComponent()),
        ),
      ),
    );
  }
}
