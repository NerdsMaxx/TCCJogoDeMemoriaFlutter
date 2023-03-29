import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/features/cards_editing/view_model/memory_game_field_view_model.dart';

class MemoryGameFieldComponent extends StatefulWidget {
  const MemoryGameFieldComponent({super.key});

  @override
  State<MemoryGameFieldComponent> createState() => _MemoryGameFieldComponentState();
}

class _MemoryGameFieldComponentState extends State<MemoryGameFieldComponent> {
  late final MemoryGameFieldViewModel viewModel = MemoryGameFieldViewModel(context);

  @override
  Widget build(BuildContext context) {
    viewModel.updateContext(context);

    return SizedBox(
      width: 460,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Nome do jogo de memória',
                    ),
                    initialValue: viewModel.memoryGameName,
                    onChanged: viewModel.onChangedMemoryGameName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Matérias',
                    ),
                    initialValue: viewModel.subjects,
                    onChanged: viewModel.onChangedSubject,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: viewModel.onPressedSave,
                child: const Text('Salvar'),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
