import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/cards_grid_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/components/memory_game_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/context/memory_game_context.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/notifier/face_card_count_notifier.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/models/optional_model.dart';

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
  final FaceCardCountNotifier _faceCardCountNotifier = FaceCardCountNotifier(0);
  final OptionalModel<CardModel> _optionalFirstCard = OptionalModel();
  final OptionalModel<CardModel> _optionalSecondCard = OptionalModel();
  final OptionalModel<CardModel> _optionalTemporaryCard = OptionalModel();
  final List<MemoryGameCardComponent> _cardWidgets = [];

  int _movements = 0;
  int _found = 0;

  @override
  void initState() {
    super.initState();

    for (CardModel card in widget.cardList) {
      MemoryGameCardComponent memoryGameCardComponent = MemoryGameCardComponent(
        card: card,
      );

      _cardWidgets.add(memoryGameCardComponent);
    }

    _cardWidgets.shuffle();

    _faceCardCountNotifier.addListener(() {
      setState(() {
        if (_faceCardCountNotifier.value == 2) {
          bool isAccepted =
              _optionalFirstCard.value!.otherCard!.id == _optionalSecondCard.value!.id;

          if (isAccepted) {
            _optionalFirstCard.value!.isAccepted = true;
            _optionalSecondCard.value!.isAccepted = true;
            ++_found;
          }

          ++_movements;
        }

        bool isLastTwoCards =
            _cardWidgets.where((cardWidget) => !cardWidget.card.isAccepted).length == 2 &&
                _optionalFirstCard.isPresent() &&
                _optionalSecondCard.isPresent();

        if (_faceCardCountNotifier.value == 3 || isLastTwoCards) {
          bool isWrong = _optionalFirstCard.value!.otherCard!.id != _optionalSecondCard.value!.id;

          if (isWrong) {
            _optionalFirstCard.value!.isTurned = false;
            _optionalSecondCard.value!.isTurned = false;
          }

          _optionalFirstCard.clear();
          _optionalSecondCard.clear();

          if (_faceCardCountNotifier.value == 3) {
            _optionalFirstCard.value = _optionalTemporaryCard.value;
            _optionalTemporaryCard.clear();

            _faceCardCountNotifier.valueWithoutNotifying = 1;
          } else if (isLastTwoCards) {
            _faceCardCountNotifier.valueWithoutNotifying = 0;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return CustomAppBarComponent(
      body: MemoryGameContext(
        faceCardCountNotifier: _faceCardCountNotifier,
        optionalFirstCard: _optionalFirstCard,
        optionalSecondCard: _optionalSecondCard,
        optionalTemporaryCard: _optionalTemporaryCard,
        child: Column(
          children: [
            const SizedBox(
              height: 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectableText(
                  'Movimentos: $_movements',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                SelectableText(
                  'Encontrados: $_found',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 52,
            ),
            CardsGridComponent(
              cards: _cardWidgets
                  .map((cardWidget) => MemoryGameCardComponent(
                        key: UniqueKey(),
                        card: cardWidget.card,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
