import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/card_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';

class CardComponent extends StatefulWidget {
  const CardComponent({
    super.key,
    required this.card,
  });

  final CardGameplayModel card;

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    final CardGameplayModel card = widget.card;

    return CardWidget(
      key: Key(widget.card.id),
      child: ValueListenableBuilder(
        valueListenable: card.isTurned,
        builder: (context, value, _) => TextButton(
          child: Text(
            (value) ? card.content : '?',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          onPressed: () {
            card.turnsCard();
            CardGameplayContext.setCardFromContext(context, card);
          },
        ),
      ),
    );
  }
}
