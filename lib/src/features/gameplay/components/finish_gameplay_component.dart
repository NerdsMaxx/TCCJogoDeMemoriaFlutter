import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/view_model/finish_gameplay_view_model.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';

class FinishGameplayComponent extends StatelessWidget {
  const FinishGameplayComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final FinishGameplayViewModel viewModel = FinishGameplayViewModel(context);

    return Center(
      child: CustomContainerWidget(
        child: Column(
          children: [
            SelectableText(
              'Terminou!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SelectableText(
              'Pontuação: ${viewModel.memoryGameGameplayContext.score}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SelectableText(
              'Tentativas: ${viewModel.memoryGameGameplayContext.numberAttempts}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SelectableText(
              'Opções certas: ${viewModel.memoryGameGameplayContext.numberRightOptions}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SelectableText(
              'Opções erradas: ${viewModel.memoryGameGameplayContext.numberWrongOptions}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: viewModel.onPressedFinished,
              child: const Text('Terminar'),
            )
          ],
        ),
      ),
    );
  }
}
