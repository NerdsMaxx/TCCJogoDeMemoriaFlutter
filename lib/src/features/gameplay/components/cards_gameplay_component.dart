import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/view_model/cards_gameplay_view_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';

class CardsGameplayComponent extends StatefulWidget {
  const CardsGameplayComponent({super.key});

  @override
  State<CardsGameplayComponent> createState() => _CardsGameplayComponentState();
}

class _CardsGameplayComponentState extends State<CardsGameplayComponent> {
  late final CardsGameplayViewModel viewModel = CardsGameplayViewModel(context);

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
                    viewModel.cardGameplay1.content,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CardWidget(
                  child: Text(
                    viewModel.cardGameplay2.content,
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
                  onPressed: viewModel.onPressedItsRight,
                  child: const Text('Está certo!'),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: viewModel.onPressedItsWrong,
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
