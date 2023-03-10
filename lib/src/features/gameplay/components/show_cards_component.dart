import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/components/card_component.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/card_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';

class ShowCardsComponent extends StatelessWidget {
  const ShowCardsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<CardGameplayModel> cardList = CardGameplayContext.getCardListFromContext(context)!;

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
              .toList(),
        ),
      ),
    );
  }
}
