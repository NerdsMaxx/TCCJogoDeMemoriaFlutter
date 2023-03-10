import 'package:flutter/material.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/gameplay/components/cards_gameplay_component.dart';
import 'package:memory_game_web/src/features/gameplay/components/scores_component.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/card_gameplay_context.dart';
import 'package:memory_game_web/src/features/gameplay/controllers/gameplay_controller.dart';
import 'package:memory_game_web/src/features/gameplay/models/memory_game_gameplay_model.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/features/gameplay/components/show_cards_component.dart';

class GameplayPage extends StatefulWidget {
  const GameplayPage({
    super.key,
    this.memoryGameName,
    this.creatorUsername,
  });

  final String? memoryGameName;
  final String? creatorUsername;

  @override
  State<GameplayPage> createState() => _GameplayPageState();
}

class _GameplayPageState extends State<GameplayPage> {
  late final GameplayController _controller = GameplayController(widget.memoryGameName, widget.creatorUsername);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: CardGameplayContext(
        showGameplayCard: _controller.showCard,
        cardGameplayList: _controller.cardGameplayList,
        child: Center(
          child: Column(
            children: [
              const ScoresComponent(),
              const SizedBox(
                height: 50,
              ),
              CustomFutureBuilderWidget<MemoryGameDto, MemoryGameGameplayModel, Object>(
                future: _controller.futureMemoryGameDto,
                transformData: (data) => MemoryGameGameplayModel.fromDto(data),
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
                  _controller.cardGameplayList.addAll(value.cardList);

                  return ValueListenableBuilder(
                    valueListenable: _controller.showCard,
                    builder: (context, showCardsGameplay, _) => Stack(
                      children: [
                        const ShowCardsComponent(), //não pode ser constante, pois senão não vai atualizar
                        Visibility(
                          visible: showCardsGameplay,
                          child: const CardsGameplayComponent(),
                        ),
                      ],
                    ),
                  );
                },
                onError: (context, error) => SelectableText(error.toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
