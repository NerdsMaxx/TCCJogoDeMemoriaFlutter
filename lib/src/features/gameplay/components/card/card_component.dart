import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/card_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';

part 'card_component_logic.dart';

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

  late final _CardComponentLogic logic = _CardComponentLogic(widget.card);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      key: Key(widget.card.id),
      child: ValueListenableBuilder(
        valueListenable: logic.card.isTurned,
        builder: (context, value, _) => TextButton(
          onPressed: logic.onPressedCard(context),
          child: Text(
            (value) ? logic.card.content : '?',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        )
      ),
    );
  }
}
