import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/cards_grid_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/components/memory_game_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/context/memory_game_context.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

class MemoryGamePage extends StatefulWidget {
  const MemoryGamePage({
    super.key,
    required this.cardList,
  });

  final List<CardModel> cardList;

  @override
  State<MemoryGamePage> createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> {
  final ValueNotifier<int> _faceCardCount = ValueNotifier(0);
  CardModel? _firstCard;
  CardModel? _secondCard;

  List<Widget> _generateCards() {
    final List<Widget> cardWidgets = [];

    for (CardModel card in widget.cardList) {
      MemoryGameCardComponent memoryGameCardComponent = MemoryGameCardComponent(card: card);
      cardWidgets.add(memoryGameCardComponent);
    }
    
    cardWidgets.shuffle();
    return cardWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBarComponent(
      body: MemoryGameContext(
        faceCardCountNotifier: _faceCardCount,
        firstCard: _firstCard,
        secondCard: _secondCard,
        child: ValueListenableBuilder(
          valueListenable: _faceCardCount,
          builder: (_, value, __) {
            if (_faceCardCount.value == 3) {
              if (_firstCard!.otherCard!.id == _secondCard!.id) {
                _firstCard!.isAccepted = true;
                _secondCard!.isAccepted = true;
              } else {
                _firstCard!.isTurned = false;
                _secondCard!.isTurned = false;
              }

              _firstCard = null;
              _secondCard = null;
            }

            return Column(
              children: [
                CardsGridComponent(
                  cards: _generateCards(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
