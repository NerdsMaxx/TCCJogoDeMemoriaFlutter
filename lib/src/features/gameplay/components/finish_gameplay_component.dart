import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
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
              'Pontuação: ${MemoryGameGameplayContext.of(context)!.getScoreValue()}',
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
