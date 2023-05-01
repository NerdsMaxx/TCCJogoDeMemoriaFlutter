import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/components/cards_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/components/memory_game_field_component.dart';
import 'package:memory_game_web/src/features/cards_editing/components/memory_game_saved_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/features/cards_editing/components/show_cards_component.dart';
import 'package:memory_game_web/src/widgets/value_listenable_builder_2_widget.dart';

@RoutePage(name: 'CardAddingRoute')
class MemoryGameAddingPage extends StatefulWidget {
  const MemoryGameAddingPage({
    super.key,
  });

  @override
  State<MemoryGameAddingPage> createState() => _MemoryGameAddingPageState();
}

class _MemoryGameAddingPageState extends State<MemoryGameAddingPage> {
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      back: true,
      body: MemoryGameEditingContext(
        isNew: true,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Builder(
                builder: (context) {
                  final MemoryGameEditingContext memoryGameEditingContext =
                      MemoryGameEditingContext.of(context)!;

                  return Column(
                    children: [
                      const MemoryGameFieldComponent(),
                      ValueListenableBuilder2Widget(
                        valueListenable1: memoryGameEditingContext.showEditableCard,
                        valueListenable2: memoryGameEditingContext.showSavedMemoryGame,
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
                            )
                          ],
                        ),
                      ),
                    ],
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
