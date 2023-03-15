import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/models/card_model.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';

part 'save_button_component_logic.dart';

class SaveButtonComponent extends StatelessWidget {
  const SaveButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final _SaveButtonComponentLogic logic = _SaveButtonComponentLogic();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: logic.onPressedSave(context),
          child: const Text('Salvar'),
        )
      ],
    );
  }
}
