import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/dashboard/view_model/code_generator_view_model.dart';
import 'package:memory_game_web/src/models/gameplay_model.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';

class CodeGeneratorComponent extends StatefulWidget {
  const CodeGeneratorComponent({
    super.key,
  });

  @override
  State<CodeGeneratorComponent> createState() => _CodeGeneratorComponentState();
}

class _CodeGeneratorComponentState extends State<CodeGeneratorComponent> {
  late final CodeGeneratorViewModel viewModel = CodeGeneratorViewModel(context);

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainerWidget(
          child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: viewModel.reload,
            builder: (context, _, __) => CustomFutureBuilderWidget<GameplayModel, GameplayModel>(
              future: viewModel.futureCode,
              onLoading: (context) => const CircularProgressIndicator(),
              onData: (context, gameplay) => SelectableText(
                gameplay.code!,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: viewModel.onPressedCodeGenerator,
            child: const Text('Gerar outro código'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: viewModel.onPressedExit,
            child: const Text('Sair'),
          ),
        ],
      )),
    );
  }
}
