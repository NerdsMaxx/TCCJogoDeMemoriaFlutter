import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';

class EditableCardsWidget extends StatefulWidget {
  const EditableCardsWidget({
    super.key,
    required this.card,
  });

  final CardEditingModel card;

  @override
  State<EditableCardsWidget> createState() => _EditableCardsWidgetState();
}

class _EditableCardsWidgetState extends State<EditableCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CardWidget(
            child: Text(widget.card.content),
          ),
          CardWidget(
            child: Text(widget.card.otherCard.content),
          ),
        ],
      ),
    );
  }
}
