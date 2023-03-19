import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/card_gameplay_model.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/card_score_model.dart';
import 'package:memory_game_web/src/models/gameplay_result_model.dart';
import 'package:memory_game_web/src/models/player_score_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';

part 'finish_gameplay_component_logic.dart';

class FinishGameplayComponent extends StatelessWidget {
  const FinishGameplayComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final _FinishGameplayComponentLogic logic = _FinishGameplayComponentLogic();

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
              onPressed: logic.onPressedFinished(context),
              child: const Text('Terminar'),
            )
          ],
        ),
      ),
    );
  }
}
