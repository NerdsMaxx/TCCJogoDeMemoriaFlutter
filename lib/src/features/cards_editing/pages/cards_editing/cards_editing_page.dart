import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/features/cards_editing/components/cards_editing/cards_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/models/memory_game_editing_model.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/features/cards_editing/components/show_cards_component.dart';

part 'cards_editing_logic.dart';

class CardsEditingPage extends StatefulWidget {
  const CardsEditingPage({
    super.key,
    this.memoryGameName,
    this.isAdding = false,
  });

  final String? memoryGameName;
  final bool isAdding;

  @override
  State<CardsEditingPage> createState() => _CardsEditingPageState();
}

class _CardsEditingPageState extends State<CardsEditingPage> {
  late final _CardsEditingLogic logic = _CardsEditingLogic(widget.memoryGameName);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: MemoryGameEditingContext(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Builder(builder: (context) {
                return CustomFutureBuilderWidget<MemoryGameModel, MemoryGameEditingModel, Object>(
                  future: logic.futureMemoryGameModel,
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
                    MemoryGameEditingContext.of(context)!.cardEditingList.addAll(value.cardList);

                    return ValueListenableBuilder(
                      valueListenable: MemoryGameEditingContext.of(context)!.showEditableCard,
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
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
