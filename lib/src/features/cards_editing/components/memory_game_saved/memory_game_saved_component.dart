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
            const SelectableText('Jogo salvo!'),
            SelectableText(
              MemoryGameEditingContext.of(context)!.memoryGameName,
            ),
            SelectableText(
              MemoryGameEditingContext.of(context)!.subjectList.join(', '),
            ),
            ElevatedButton(
              onPressed: logic.onPressedCreateOtherMemoryGame(context),
              child: const Text('Criar outro jogo de memória'),
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
