import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';

part 'memory_game_field_component_logic.dart';

class MemoryGameFieldComponent extends StatefulWidget {
  const MemoryGameFieldComponent({super.key});

  @override
  State<MemoryGameFieldComponent> createState() => _MemoryGameFieldComponentState();
}

class _MemoryGameFieldComponentState extends State<MemoryGameFieldComponent> {
  late final _MemoryGameFieldComponentLogic logic = _MemoryGameFieldComponentLogic(context);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: logic.formKey,
      child: SizedBox(
        width: 460,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nome do jogo de memória',
              ),
              initialValue: logic.memoryGameName,
              onChanged: logic.onChangedMemoryGameName(context),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Matérias',
              ),
              initialValue: logic.subjects,
              onChanged: logic.onChangedSubject(context),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
