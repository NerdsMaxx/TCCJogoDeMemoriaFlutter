import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/components/cards_editing/cards_editing_component.dart';
import 'package:memory_game_web/src/features/cards_editing/components/memory_game_field/memory_game_field_component.dart';
import 'package:memory_game_web/src/features/cards_editing/components/memory_game_saved/memory_game_saved_component.dart';
import 'package:memory_game_web/src/features/cards_editing/components/save_button/save_button_component.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/features/cards_editing/components/show_cards_component.dart';
import 'package:memory_game_web/src/widgets/value_listenable_builder_2_widget.dart';

class CardsAddingPage extends StatefulWidget {
  const CardsAddingPage({
    super.key,
  });

  @override
  State<CardsAddingPage> createState() => _CardsAddingPageState();
}

class _CardsAddingPageState extends State<CardsAddingPage> {
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
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
                  return Column(
                    children: [
                      SaveButtonComponent(),
                      ValueListenableBuilder2Widget(
                        valueListenable1: MemoryGameEditingContext.of(context)!.showEditableCard,
                        valueListenable2: MemoryGameEditingContext.of(context)!.showSavedMemoryGame,
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
