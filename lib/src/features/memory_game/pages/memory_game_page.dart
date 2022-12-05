import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/cards_grid_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_container_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/components/memory_game_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/context/memory_game_context.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/notifier/face_card_count_notifier.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/models/optional_model.dart';
import 'package:jogo_de_memoria_flutter/src/widgets/text_button_widget.dart';

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

  bool _isFinished = false;

  void reset() {
    _faceCardCountNotifier.value = 0;
    _optionalFirstCard.clear();
    _optionalSecondCard.clear();
    _optionalTemporaryCard.clear();

    _cardWidgets.clear();

    for (CardModel card in widget.cardList) {
      card.isAccepted = false;
      card.isTurned = false;
      MemoryGameCardComponent memoryGameCardComponent = MemoryGameCardComponent(
        card: card,
      );

      _cardWidgets.add(memoryGameCardComponent);
    }

    _cardWidgets.shuffle();

    _movements = 0;
    _found = 0;

    _isFinished = false;
  }

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

            _isFinished = _cardWidgets.length / 2 == _found;
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
        child: Stack(
          children: [
            Column(
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
            Visibility(
              visible: _isFinished,
              child: CustomContainerComponent(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SelectableText(
                      'Terminou!',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SelectableText(
                      'Movimentos: $_movements',
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                     SelectableText(
                      'Encontrados: $_found',
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButtonWidget(
                      text: 'Jogar novamente',
                      onPressed: reset,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButtonWidget(
                      text: 'Voltar para tela inicial',
                      onPressed: () => context.go('/dashboard'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
