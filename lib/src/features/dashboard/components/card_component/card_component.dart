import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/models/gameplay_model.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/player_added_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';
import 'package:memory_game_web/src/widgets/circle_button_widget.dart';

part 'card_component_logic.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    super.key,
    required this.memoryGameModel,
  });

  final MemoryGameModel memoryGameModel;

  @override
  Widget build(BuildContext context) {
    final _CardComponentLogic logic = _CardComponentLogic(memoryGameModel);

    return CardWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SelectableText(
                memoryGameModel.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButtonWidget(
                    tooltip: 'Jogar',
                    onPressed: logic.onPressedGameplay(context),
                    icon: Icons.play_arrow,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: getIt<Auth>().isCreator(),
                    child: CircleButtonWidget(
                      tooltip: 'Editar',
                      onPressed: logic.onPressedEditing(context),
                      icon: Icons.edit,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: getIt<Auth>().isCreator(),
                    child: CircleButtonWidget(
                      tooltip: 'Gerar código',
                      onPressed: logic.onPressedCodeGenerator(context),
                      icon: Icons.refresh_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
