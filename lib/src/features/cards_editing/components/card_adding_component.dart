import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/context/card_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_adding_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';

class CardAddingComponent extends StatefulWidget {
  const CardAddingComponent({super.key});

  @override
  State<CardAddingComponent> createState() => _CardAddingComponentState();
}

class _CardAddingComponentState extends State<CardAddingComponent> {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => CardEditingContext.of(context)!.setCard(CardAddingModel()),
            child: Text(
              '+',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}
