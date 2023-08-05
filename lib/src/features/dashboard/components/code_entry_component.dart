import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/dashboard/view_model/code_entry_view_model.dart';
import 'package:memory_game_web/src/models/player_added_model.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

class CodeEntryComponent extends StatefulWidget {
  const CodeEntryComponent({
    super.key,
  });

  @override
  State<CodeEntryComponent> createState() => _CodeEntryComponentState();
}

class _CodeEntryComponentState extends State<CodeEntryComponent> {
  late final CodeEntryViewModel viewModel = CodeEntryViewModel(context);

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomContainerWidget(
        child: ValueListenableBuilder(
          valueListenable: viewModel.searchCode,
          builder: (context, searchCode, _) => Column(
            children: [
              Visibility(
                visible: !searchCode,
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 420,
                        child: CustomTextFieldFormWidget(
                          hintText: 'Digite o código',
                          initialValue: viewModel.code,
                          autofocus: true,
                          onChanged: (value) => viewModel.code = value,
                          maxLength: 4,
                          validator: viewModel.validatorCode,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: viewModel.onPressedSearchCode,
                        child: const Text('Procurar'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: viewModel.onPressedExit,
                        child: const Text('Sair'),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: searchCode,
                child: 
                CustomFutureBuilderWidget<PlayerAddedModel, PlayerAddedModel>(
                  future: viewModel.futurePlayerAddedModel,
                  onLoading: (context) => const CircularProgressIndicator(),
                  onData: (context, value) => Column(
                    children: [
                      SelectableText(
                        value.memoryGame.name,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SelectableText(
                        'Do criador: ${value.memoryGame.creator}',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      ElevatedButton(
                        onPressed: viewModel.onPressedEnterInGameplay(value),
                        child: const Text('Jogar'),
                      ),
                    ],
                  ),
                 executeOnErrorExtraFunction: () => viewModel.onPressedRetry()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}