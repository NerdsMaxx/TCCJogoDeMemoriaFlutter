import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/dtos/gameplay_dto.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';

import 'package:memory_game_web/src/services/gameplay_service.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';

part 'code_generator_component_logic.dart';

class CodeGeneratorComponent extends StatefulWidget {
  const CodeGeneratorComponent({
    super.key,
  });

  @override
  State<CodeGeneratorComponent> createState() => _CodeGeneratorComponentState();
}

class _CodeGeneratorComponentState extends State<CodeGeneratorComponent> {
  late final _CodeGeneratorComponentLogic logic = _CodeGeneratorComponentLogic(context);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainerWidget(
          child: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: logic.reload,
            builder: (context, _, __) =>
                CustomFutureBuilderWidget<GameplayDto, GameplayDto, Object>(
              future: logic.futureCode,
              onLoading: (context) => const CircularProgressIndicator(),
              onData: (context, code) => SelectableText(
                code.code,
              ),
              onError: (context, valueError) => SelectableText(
                valueError.toString(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: logic.onPressedCodeGenerator(),
            child: const Text('Gerar outro código'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: logic.onPressedExit(context),
            child: const Text('Sair'),
          ),
        ],
      )),
    );
  }
}
