import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/features/gameplay/view_model/card_view_model.dart';
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

  late final CardViewModel viewModel = CardViewModel(context, widget.card);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      key: Key(widget.card.id),
      child: ValueListenableBuilder(
        valueListenable: viewModel.card.isTurned,
        builder: (context, value, _) => TextButton(
          onPressed: viewModel.onPressedCard,
          child: Text(
            (value) ? viewModel.card.content : '?',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        )
      ),
    );
  }
}
