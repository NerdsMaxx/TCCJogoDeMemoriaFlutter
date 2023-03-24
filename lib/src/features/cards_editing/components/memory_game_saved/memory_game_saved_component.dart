import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';

part 'memory_game_saved_component_logic.dart';

class SavedMemoryGameComponent extends StatelessWidget {
  const SavedMemoryGameComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final _SavedMemoryGameComponentLogic logic = _SavedMemoryGameComponentLogic();

    return Center(
      child: CustomContainerWidget(
        child: Column(
          children: [
            SelectableText(
              'Jogo salvo!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SelectableText(
              MemoryGameEditingContext.of(context)!.memoryGameName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SelectableText(
              MemoryGameEditingContext.of(context)!.subjectList.join(', '),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: logic.onPressedCreateOtherMemoryGame(context),
              child: const Text('Criar outro jogo de memória'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: logic.onPressedExitDashboard(context),
              child: const Text('Voltar para dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
