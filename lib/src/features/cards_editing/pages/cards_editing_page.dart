import 'package:flutter/material.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/cards_editing/components/cards_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/card_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/controller/cards_editing_controller.dart';
import 'package:memory_game_web/src/features/cards_editing/models/memory_game_editing_model.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/features/cards_editing/components/show_cards_component.dart';

class CardsEditingPage extends StatefulWidget {
  const CardsEditingPage({
    super.key,
    this.memoryGameName,
  });

  final String? memoryGameName;

  @override
  State<CardsEditingPage> createState() => _CardsEditingPageState();
}

class _CardsEditingPageState extends State<CardsEditingPage> {
  late final CardsEditingController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = CardsEditingController(widget.memoryGameName);

    return AppBarWidget(
      body: CardEditingContext(
        showEditableCard: _controller.showEditableCard,
        cardEditingList: _controller.cardEditingList,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              CustomFutureBuilderWidget<MemoryGameDto, MemoryGameEditingModel, Object>(
                future: _controller.futureMemoryGameDto,
                transformData: (data) => MemoryGameEditingModel.fromDto(data),
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
                  _controller.cardEditingList.addAll(value.cardList);

                  return ValueListenableBuilder(
                    valueListenable: _controller.showEditableCard,
                    builder: (context, showCardsEditing, _) => Stack(
                      children: [
                        ShowCardsComponent(), //não pode ser constante, pois senão não vai atualizar
                        Visibility(
                          visible: showCardsEditing,
                          child: const CardsEditingComponent(),
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
