import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';
import 'package:memory_game_web/src/widgets/circle_button_widget.dart';

class CardComponent extends StatefulWidget {
  const CardComponent({
    super.key,
    required this.card,
  });

  final CardEditingModel card;

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return CardWidget(
      key: Key(widget.card.id),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectableText(
            widget.card.content,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleButtonWidget(
                tooltip: 'Editar',
                onPressed: () => MemoryGameEditingContext.of(context)!.setCard(widget.card),
                icon: Icons.edit,
              ),
              const SizedBox(
                width: 10,
              ),
              CircleButtonWidget(
                tooltip: 'Excluir',
                onPressed: () => MemoryGameEditingContext.of(context)!.removeCard(widget.card),
                icon: Icons.cancel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}