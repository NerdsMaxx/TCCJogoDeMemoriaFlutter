import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/gameplay/components/cards_gameplay_component.dart';
import 'package:memory_game_web/src/features/gameplay/components/finish_gameplay_component.dart';
import 'package:memory_game_web/src/features/gameplay/components/player_score_component.dart';
import 'package:memory_game_web/src/features/gameplay/components/show_cards_component.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/models/memory_game_gameplay_model.dart';
import 'package:memory_game_web/src/features/gameplay/view_model/gameplay_view_model.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/widgets/value_listenable_builder_2_widget.dart';

@RoutePage(name: 'GameplayRoute')
class GameplayPage extends StatefulWidget {
  const GameplayPage({
    super.key,
    this.memoryGameName,
    this.creatorUsername,
    this.gameplayCode,
    this.isTestingForCreator,
    this.alone,
  });

  final String? memoryGameName;
  final String? creatorUsername;
  final String? gameplayCode;
  final bool? isTestingForCreator;
  final bool? alone;

  @override
  State<GameplayPage> createState() => _GameplayPageState();
}

class _GameplayPageState extends State<GameplayPage> {
  late final GameplayViewModel viewModel;

  @override
  void dispose() {
    // viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      back: true,
      body: MemoryGameGameplayContext(
        code: widget.gameplayCode ?? LocalStorage.getString(Keys.GAMEPLAY_CODE),
        isTestingForCreator:
            widget.isTestingForCreator ?? LocalStorage.getBool(Keys.TESTING_FOR_CREATOR)!,
        alone: widget.alone ?? LocalStorage.getBool(Keys.ALONE)!,
        child: Builder(builder: (context) {
          viewModel = GameplayViewModel(
            context,
            widget.memoryGameName ?? LocalStorage.getString(Keys.MEMORY_GAME_NAME),
            widget.creatorUsername ?? LocalStorage.getString(Keys.CREATOR_USERNAME),
          );

          return Center(
            child: Column(
              children: [
                const PlayerScoreComponent(),
                const SizedBox(
                  height: 50,
                ),
                CustomFutureBuilderWidget<MemoryGameModel, MemoryGameGameplayModel>(
                  future: viewModel.futureMemoryGameModel,
                  transformData: (data) => MemoryGameGameplayModel.fromModel(data),
                  onLoading: (context) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(
                        width: 40,
                      ),
                      SelectableText(
                        'Carregando',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  onData: (context, value) {
                    viewModel.memoryGameGameplayContext.cardGameplayList
                        .addAll(value.cardList);

                    return ValueListenableBuilder2Widget(
                      valueListenable1: viewModel.memoryGameGameplayContext.showGameplayCard,
                      valueListenable2: viewModel.memoryGameGameplayContext.finishGameplay,
                      builder: (context, showCardsGameplay, finishGameplay) => Stack(
                        children: [
                          ShowCardsComponent(),
                          //não pode ser constante, pois senão não vai atualizar
                          Visibility(
                            visible: showCardsGameplay,
                            child: const CardsGameplayComponent(),
                          ),
                          Visibility(
                            visible: finishGameplay,
                            child: const FinishGameplayComponent(),
                          ),
                        ],
                      ),
                    );
                  },
                  onError: (context, error) => Center(
                    child: SelectableText(
                      error.toString(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}