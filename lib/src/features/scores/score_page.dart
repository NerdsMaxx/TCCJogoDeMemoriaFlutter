import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/scores/score_view_model.dart';
import 'package:memory_game_web/src/models/gameplay_result_model.dart';
import 'package:memory_game_web/src/models/player_result_model.dart';
import 'package:memory_game_web/src/models/previous_gameplays_player_model.dart';
import 'package:memory_game_web/src/utils/date_util.dart';
import 'package:memory_game_web/src/utils/size_util.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';

@RoutePage(name: 'ScoreRoute')
class ScorePage extends StatefulWidget {
  const ScorePage({
    super.key,
    this.code,
    this.isPreviousGameplays = false,
    this.alone,
  });

  final String? code;
  final bool isPreviousGameplays;
  final bool? alone;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  late final ScoreViewModel viewModel =
      ScoreViewModel(context, widget.isPreviousGameplays, widget.code, widget.alone);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      back: true,
      body: Center(
        child: CustomFutureBuilderWidget<Object, Object>(
          future: viewModel.futureResult,
          onLoading: (context) => const SizedBox.shrink(),
          onData: (context, value) => Column(
            children: [
              SelectableText(
                'Pontuações',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: SizeUtil.widthFactor(context, 0.3),
                  maxHeight: SizeUtil.heightFactor(context, 0.7),
                ),
                child: Builder(builder: (context) {
                  final int length;
                  final List<int> scoreList;
                  final List<String> usernameList;
                  final List<int> numberRightOptionsList,
                      numberWrongOptionsList,
                      numberAttemptsList;
                  List<String> startTimeList = [], endTimeList = [];

                  if (widget.isPreviousGameplays) {
                    final List<PreviousGameplaysPlayerModel> previousGameplayList =
                        value as List<PreviousGameplaysPlayerModel>;

                    length = previousGameplayList.length;

                    scoreList = previousGameplayList
                        .map((previousGameplay) => previousGameplay.score)
                        .toList();

                    usernameList = previousGameplayList
                        .map((previousGameplay) => previousGameplay.creator)
                        .toList();

                    numberRightOptionsList = previousGameplayList
                        .map((previousGameplay) => previousGameplay.numberRightOptions)
                        .toList();

                    numberWrongOptionsList = previousGameplayList
                        .map((previousGameplay) => previousGameplay.numberWrongOptions)
                        .toList();

                    numberAttemptsList = previousGameplayList
                        .map((previousGameplay) => previousGameplay.numberAttempts)
                        .toList();

                    startTimeList = previousGameplayList
                        .map((previousGameplay) =>
                            DateUtil.formateToString(previousGameplay.startTime))
                        .toList();

                    endTimeList = previousGameplayList
                        .map((previousGameplay) =>
                            DateUtil.formateToString(previousGameplay.endTime))
                        .toList();
                  } else {
                    final GameplayResultModel gameplayResult = value as GameplayResultModel;
                    final List<PlayerResultModel> playerResultList = value.playerResultList;

                    length = playerResultList.length;

                    scoreList = playerResultList.map((playerResult) => playerResult.score).toList();

                    if (viewModel.alone) {
                      usernameList = [gameplayResult.creator];
                    } else {
                      usernameList =
                          playerResultList.map((playerResult) => playerResult.player).toList();
                    }

                    numberRightOptionsList = playerResultList
                        .map((playerResult) => playerResult.numberRightOptions)
                        .toList();

                    numberWrongOptionsList = playerResultList
                        .map((playerResult) => playerResult.numberWrongOptions)
                        .toList();

                    numberAttemptsList = playerResultList
                        .map((previousGameplay) => previousGameplay.numberAttempts)
                        .toList();
                  }

                  return ListView.builder(
                    itemCount: length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        CustomContainerWidget(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                'Pontuação: ${scoreList[index]} pontos',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              SelectableText(
                                'Nome do ${(widget.isPreviousGameplays || viewModel.alone) ? 'criador' : 'jogador'}: ${usernameList[index]}',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              SelectableText(
                                'Quantidade de opções certas: ${numberRightOptionsList[index]}',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              SelectableText(
                                'Quantidade de opções erradas: ${numberWrongOptionsList[index]}',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              SelectableText(
                                'Quantidade de tentativas: ${numberAttemptsList[index]}',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Visibility(
                                visible: widget.isPreviousGameplays,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText(
                                      'Começo: ${startTimeList.isNotEmpty ? startTimeList[index] : null}',
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    ),
                                    SelectableText(
                                      'Fim: ${endTimeList.isNotEmpty ? endTimeList[index] : null}',
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }),
              ),
              Visibility(
                visible: !viewModel.alone,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: viewModel.onPressedReload(context),
                      child: const Text('Recarregar'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: viewModel.onPressedBackToDashboard(context),
                child: const Text('Voltar para dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
