import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/context/memory_game_context.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/notifier/face_card_count_notifier.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/models/optional_model.dart';

class MemoryGameCardComponent extends StatelessWidget {
  const MemoryGameCardComponent({
    super.key,
    required this.card,
  });

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    final MemoryGameContext memoryGameContext = MemoryGameContext.of(context)!;
    final FaceCardCountNotifier faceCardCountNotifier = memoryGameContext.faceCardCountNotifier;
    final OptionalModel<CardModel> optionalFirstCard = memoryGameContext.optionalFirstCard;
    final OptionalModel<CardModel> optionalSecondCard = memoryGameContext.optionalSecondCard;
    final OptionalModel<CardModel> optionalTemporaryCard = memoryGameContext.optionalTemporaryCard;

    return CustomCardComponent(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (!card.isTurned) {
            return Center(
              child: TextButton(
                onPressed: () {
                  if (faceCardCountNotifier.value < 3) {
                    if (optionalFirstCard.isEmpty()) {
                      optionalFirstCard.value = card;
                    } else if (optionalSecondCard.isEmpty()) {
                      optionalSecondCard.value = card;
                    } else if (optionalTemporaryCard.isEmpty()) {
                      optionalTemporaryCard.value = card;
                    }
                  
                    card.isTurned = true;
                    faceCardCountNotifier.value++;
                  }
                },
                child: const Text(
                  '?',
                  style: TextStyle(
                    fontSize: 64,
                  ),
                ),
              ),
            );
          }

          return Center(
            child: TextButton(
              onPressed: () {},
              child: AutoSizeText(
                card.phrase,
                wrapWords: false,
                style: const TextStyle(
                  fontSize: 42,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

                // if (card.isAccepted) {
                //   return;
                // }

                // if (faceCardCountNotifier.value > 0) {
                //   if (optionalSecondCard.isPresent() && optionalFirstCard.value!.id == card.id) {
                //     optionalFirstCard.clear();
                //   } else if (optionalSecondCard.isPresent() &&
                //       optionalSecondCard.value!.id == card.id) {
                //     optionalSecondCard.clear();
                //   } else if (optionalTemporaryCard.isPresent() &&
                //       optionalTemporaryCard.value!.id == card.id) {
                //     optionalTemporaryCard.clear();
                //   }

                //   card.isTurned = false;
                //   faceCardCountNotifier.value--;
                // }