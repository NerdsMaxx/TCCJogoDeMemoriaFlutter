import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/card_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';

class CardsGameplayComponent extends StatefulWidget {
  const CardsGameplayComponent({super.key});

  @override
  State<CardsGameplayComponent> createState() => _CardsGameplayComponentState();
}

class _CardsGameplayComponentState extends State<CardsGameplayComponent> {
  late final CardGameplayModel cardGameplay1 = CardGameplayContext.of(context)!.card1!;
  late final CardGameplayModel cardGameplay2 = CardGameplayContext.of(context)!.card2!;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainerWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CardWidget(
                  child: Text(
                    cardGameplay1.content,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CardWidget(
                  child: Text(
                    cardGameplay2.content,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (cardGameplay1.isAccepted && cardGameplay2.isAccepted) {
                      return;
                    }

                    CardGameplayContext.itsRight(context);
                  },
                  child: const Text('Está certo!'),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (cardGameplay1.isAccepted || cardGameplay2.isAccepted) {
                      return;
                    }

                    CardGameplayContext.itsWrong(context);
                  },
                  child: const Text('Está errado!'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
