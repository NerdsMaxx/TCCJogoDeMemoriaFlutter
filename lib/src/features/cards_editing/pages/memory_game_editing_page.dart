import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/components/memory_game_field_component.dart';
import 'package:memory_game_web/src/features/cards_editing/components/memory_game_saved_component.dart';
import 'package:memory_game_web/src/features/cards_editing/view_model/memory_game_editing_view_model.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/features/cards_editing/components/cards_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/memory_game_editing_model.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/features/cards_editing/components/show_cards_component.dart';
import 'package:memory_game_web/src/widgets/value_listenable_builder_2_widget.dart';

@RoutePage(name: 'CardsEditingRoute')
class MemoryGameEditingPage extends StatefulWidget {
  const MemoryGameEditingPage({
    super.key,
    this.memoryGameName,
    this.isAdding = false,
  });

  final String? memoryGameName;
  final bool isAdding;

  @override
  State<MemoryGameEditingPage> createState() => _MemoryGameEditingPageState();
}

class _MemoryGameEditingPageState extends State<MemoryGameEditingPage> {
  late final MemoryGameEditingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      back: true,
      body: MemoryGameEditingContext(
        isNew: false,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Builder(
                builder: (context) {
                  viewModel = MemoryGameEditingViewModel(context, widget.memoryGameName);

                  return CustomFutureBuilderWidget<MemoryGameModel, MemoryGameEditingModel>(
                    future: viewModel.futureMemoryGameModel,
                    transformData: (data) => MemoryGameEditingModel.fromMemoryGameModel(data),
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
                      viewModel.memoryGameEditingContext
                        ..oldMemoryGameName = value.name
                        ..cardEditingList.addAll(value.cardList)
                        ..memoryGameName = value.name
                        ..subjectList = value.subjectList;

                      return Column(
                        children: [
                          const MemoryGameFieldComponent(),
                          ValueListenableBuilder2Widget(
                            valueListenable1: viewModel.memoryGameEditingContext.showEditableCard,
                            valueListenable2:
                                viewModel.memoryGameEditingContext.showSavedMemoryGame,
                            builder: (context, showCardsEditing, showSavedMemoryGame) => Stack(
                              children: [
                                ShowCardsComponent(), //não pode ser constante, pois senão não vai atualizar
                                Visibility(
                                  visible: !showSavedMemoryGame && showCardsEditing,
                                  child: const CardsEditingComponent(),
                                ),
                                Visibility(
                                  visible: showSavedMemoryGame,
                                  child: const SavedMemoryGameComponent(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
