import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/models/player_added_model.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

part 'code_entry_component_logic.dart';

class CodeEntryComponent extends StatefulWidget {
  const CodeEntryComponent({
    super.key,
  });

  @override
  State<CodeEntryComponent> createState() => _CodeEntryComponentState();
}

class _CodeEntryComponentState extends State<CodeEntryComponent> {
  final _CodeEntryComponentLogic logic = _CodeEntryComponentLogic();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainerWidget(
        child: ValueListenableBuilder(
          valueListenable: logic.searchCode,
          builder: (context, searchCode, _) => Column(
            children: [
              Visibility(
                visible: !searchCode,
                child: Form(
                  key: logic.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 420,
                        child: CustomTextFieldFormWidget(
                          hintText: 'Digite o código',
                          initialValue: logic.code,
                          autofocus: true,
                          onChanged: (value) => logic.code = value,
                          maxLength: 4,
                          validator: logic.validatorCode,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: logic.onPressedSearchCode(context),
                        child: const Text('Procurar'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: logic.onPressedExit(context),
                        child: const Text('Sair'),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: searchCode,
                child: CustomFutureBuilderWidget<PlayerAddedModel, PlayerAddedModel, Object>(
                  future: logic.futurePlayerAddedModel,
                  onLoading: (context) => const CircularProgressIndicator(),
                  onData: (context, value) => Column(
                    children: [
                      SelectableText(value.memoryGame.name),
                      SelectableText('Do criador: ${value.memoryGame.creator}'),
                      ElevatedButton(
                        onPressed: logic.onPressedEnterInGameplay(context, value),
                        child: const Text('Jogar'),
                      ),
                    ],
                  ),
                  onError: (context, valueError) => Column(
                    children: [
                      SelectableText(
                        valueError.toString(),
                      ),
                      ElevatedButton(
                        onPressed: logic.onPressedRetry(),
                        child: Text(valueError.toString()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
