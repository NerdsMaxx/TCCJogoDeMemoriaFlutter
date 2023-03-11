import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/card_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';

part 'cards_gameplay_component_logic.dart';

class CardsGameplayComponent extends StatefulWidget {
  const CardsGameplayComponent({super.key});

  @override
  State<CardsGameplayComponent> createState() => _CardsGameplayComponentState();
}

class _CardsGameplayComponentState extends State<CardsGameplayComponent> {
  late final _CardsGameplayComponentLogic logic = _CardsGameplayComponentLogic(context);

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
                    logic.cardGameplay1.content,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CardWidget(
                  child: Text(
                    logic.cardGameplay2.content,
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
                  onPressed: logic.onPressedItsRight(context),
                  child: const Text('Está certo!'),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: logic.onPressedItsWrong(context),
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
