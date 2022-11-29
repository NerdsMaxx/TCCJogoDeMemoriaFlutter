import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/context/memory_game_context.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

class MemoryGameCardComponent extends StatefulWidget {
  const MemoryGameCardComponent({
    super.key,
    required this.card,
  });

  final CardModel card;

  @override
  State<MemoryGameCardComponent> createState() => _MemoryGameCardComponentState();
}

class _MemoryGameCardComponentState extends State<MemoryGameCardComponent> {
  final ValueNotifier<bool> _cardIsTurned = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    MemoryGameContext memoryGameContext = MemoryGameContext.of(context)!;
    ValueNotifier<int> faceCardCountNotifier = memoryGameContext.faceCardCountNotifier;

    return CustomCardComponent(
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: _cardIsTurned,
          builder: (_, value, __) => Column(
            children: [
              Visibility(
                visible: value,
                child: TextButton(
                  onPressed: () {
                    if (faceCardCountNotifier.value < 2) {
                      faceCardCountNotifier.value++;

                      memoryGameContext.firstCard ??= widget.card;
                      memoryGameContext.secondCard ??= widget.card;

                      widget.card.isTurned = true;
                      value = widget.card.isTurned;
                      return;
                    }

                    if (faceCardCountNotifier.value < 3) {
                      faceCardCountNotifier.value++;
                    }
                  },
                  child: const Text('?'),
                ),
              ),
              Visibility(
                visible: !value,
                child: TextButton(
                  onPressed: () {
                    if (faceCardCountNotifier.value > 0) {
                      faceCardCountNotifier.value--;

                      if (memoryGameContext.firstCard!.id == widget.card.id) {
                        memoryGameContext.firstCard = null;
                      } else if (memoryGameContext.secondCard != null &&
                          memoryGameContext.secondCard == widget.card) {
                        memoryGameContext.secondCard = null;
                      }

                      widget.card.isTurned = false;
                      value = widget.card.isTurned;
                    }
                  },
                  child: Text(
                    widget.card.phrase,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
