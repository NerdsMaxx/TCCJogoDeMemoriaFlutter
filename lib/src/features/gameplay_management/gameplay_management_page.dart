import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/enums/score_type_enum.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/codes_model.dart';
import 'package:memory_game_web/src/models/previous_gameplays_creator_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';
import 'package:memory_game_web/src/utils/date_util.dart';
import 'package:memory_game_web/src/utils/size_util.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';

part 'gameplay_management_view_model.dart';

@RoutePage(name: 'GameplayManagementRoute')
class GameplayManagementPage extends StatelessWidget {
  const GameplayManagementPage({
    super.key,
    this.currentGameplays,
  });

  final bool? currentGameplays;

  @override
  Widget build(BuildContext context) {
    final GameplayManagementViewModel viewModel =
        GameplayManagementViewModel(context, currentGameplays);

    return AppBarWidget(
      back: true,
      body: Center(
        child: CustomFutureBuilderWidget<Object, Object>(
          future: viewModel.future..then((value) => debugPrint('CHEGOU!')),
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
          onData: (context, value) => Column(
            children: [
              SelectableText(
                'Partidas ${(viewModel.currentGameplays) ? 'atuais' : 'anteriores'}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: SizeUtil.widthFactor(context, 0.4),
                  maxHeight: SizeUtil.heightFactor(context, 0.7),
                ),
                child: Builder(builder: (context) {
                  if (value is CodesModel) {
                    if (value.codes.isEmpty) {
                      return Center(
                        child: SelectableText(
                          'Partidas atuais não encontradas!',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: value.codes.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          CustomContainerWidget(
                            child: ListTile(
                              title: SelectableText(
                                'Código: ${value.codes[index].code!}',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              subtitle: SelectableText(
                                'Jogo de memória: ${value.codes[index].name}',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              trailing: ElevatedButton(
                                onPressed:
                                    viewModel.onPressedCurrentGameplays(value.codes[index].code!),
                                child: const Text('Acompanhar'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  } else if (value is List<PreviousGameplaysCreatorModel>) {
                    if (value.isEmpty) {
                      return Center(
                        child: SelectableText(
                          'Partidas não encontradas!',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          CustomContainerWidget(
                            child: ListTile(
                              title: SelectableText(
                                value[index].memoryGame,
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText(
                                    'Código usado: ${value[index].usedCode}',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                  SelectableText(
                                    'Quantidade de jogadores: ${value[index].numbersPlayer}',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                  SelectableText(
                                    'Data e hora que começou: ${DateUtil.formatToString(value[index].startTime)}',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                  SelectableText(
                                    'Data e hora que último jogador terminou: ${DateUtil.formatToString(value[index].lastTime)}',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                ],
                              ),
                              trailing: ElevatedButton(
                                onPressed:
                                    viewModel.onPressedPlayerHistory(value[index].gameplayId),
                                child: const Text('Detalhes'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }

                  throw CustomException.anyError();
                }),
              ),
              Visibility(
                visible: viewModel.currentGameplays,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: viewModel.onPressedReload,
                      child: const Text('Recarregar'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: viewModel.onPressedBackToDashboard,
                child: const Text('Voltar para dashboard'),
              ),
            ],
          ),
          onError: (context, error) => Center(
            child: SelectableText(
              error.toString(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ),
      ),
    );
  }
}
