import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/features/dashboard/view_model/card_view_model.dart';
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
    required this.memoryGame,
  });

  final MemoryGameModel memoryGame;

  @override
  Widget build(BuildContext context) {
    final CardViewModel viewModel = CardViewModel(memoryGame: memoryGame, context: context);

    return CardWidget(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Tooltip(
                verticalOffset: -5,
                message: memoryGame.name,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
                child: SizedBox(
                  height: 60,
                  child: Text(
                    memoryGame.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Tooltip(
              verticalOffset: -30,
              message: memoryGame.subjectList!
                  .fold('', (previousValue, subject) => '$previousValue#$subject '),
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              child: SizedBox(
                height: 110,
                child: Text(
                  memoryGame.subjectList!
                      .fold('', (previousValue, subject) => '$previousValue#$subject '),
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButtonWidget(
                    tooltip: 'Jogar',
                    onPressed: viewModel.onPressedGameplay,
                    icon: Icons.play_arrow,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: getIt<Auth>().isCreator(),
                    child: CircleButtonWidget(
                      tooltip: 'Editar',
                      onPressed: viewModel.onPressedEditing,
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
                      onPressed: viewModel.onPressedCodeGenerator,
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
