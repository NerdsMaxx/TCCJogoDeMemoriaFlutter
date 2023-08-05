import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/src/enums/score_type_enum.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/features/scores/score_view_model.dart';
import 'package:memory_game_web/src/models/gameplay_result_model.dart';
import 'package:memory_game_web/src/models/player_result_model.dart';
import 'package:memory_game_web/src/models/previous_gameplays_player_model.dart';
import 'package:memory_game_web/src/utils/date_util.dart';
import 'package:memory_game_web/src/utils/size_util.dart';
import 'package:memory_game_web/src/utils/snack_bar_util.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/widgets/custom_snack_bar_widget.dart';
import 'package:memory_game_web/src/widgets/loading_widget.dart';

@RoutePage(name: 'ScoreRoute')
class ScorePage extends StatefulWidget {
  const ScorePage({
    super.key,
    this.code,
    this.gameplayId,
    this.alone,
    this.scoreType,
  });

  final String? code;
  final bool? alone;
  final int? gameplayId;
  final ScoreTypeEnum? scoreType;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  late final ScoreViewModel viewModel =
      ScoreViewModel(context, widget.scoreType, widget.gameplayId, widget.code, widget.alone);

  @override
  void dispose() {
    // viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: viewModel.reload,
          builder: (context, _, __) => CustomFutureBuilderWidget<Object, Object>(
            future: viewModel.futureResult,
            onLoading: (context) => const LoadingWidget(),
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
                    maxWidth: SizeUtil.widthFactor(context, 0.4),
                    maxHeight: SizeUtil.heightFactor(context, 0.7),
                  ),
                  child: Builder(builder: (context) {
                    final int length;

                    final List<String> memoryGameList;
                    final List<String> usernameList;
                    final List<int> scoreList;

                    final List<int> numberRightOptionsList;
                    final List<int> numberWrongOptionsList;
                    final List<int> numberAttemptsList;

                    final List<String> startTimeList;
                    final List<String> endTimeList;

                    if (value is List<PreviousGameplaysPlayerModel>) {
                      if (value.isEmpty) {
                        return Center(
                          child: SelectableText(
                            (viewModel.scoreType == ScoreTypeEnum.previousGameplayByPlayer)
                                ? 'Não foram encontradas partidas anteriores.'
                                : 'Jogadores não encontrados!',
                            style: (viewModel.scoreType == ScoreTypeEnum.previousGameplayByPlayer)
                                ? Theme.of(context).textTheme.displaySmall
                                : Theme.of(context).textTheme.displayMedium,
                          ),
                        );
                      }

                      length = value.length;

                      memoryGameList =
                          value.map((previousGameplay) => previousGameplay.memoryGame).toList();

                      if (viewModel.scoreType == ScoreTypeEnum.previousGameplayByPlayer) {
                        usernameList =
                            value.map((previousGameplay) => previousGameplay.creator).toList();
                      } else {
                        usernameList =
                            value.map((previousGameplay) => previousGameplay.player).toList();
                      }

                      scoreList = value.map((previousGameplay) => previousGameplay.score).toList();

                      numberRightOptionsList = value
                          .map((previousGameplay) => previousGameplay.numberRightOptions)
                          .toList();

                      numberWrongOptionsList = value
                          .map((previousGameplay) => previousGameplay.numberWrongOptions)
                          .toList();

                      numberAttemptsList =
                          value.map((previousGameplay) => previousGameplay.numberAttempts).toList();

                      startTimeList = value
                          .map((previousGameplay) =>
                              DateUtil.formatToString(previousGameplay.startTime))
                          .toList();

                      endTimeList = value
                          .map((previousGameplay) =>
                              DateUtil.formatToString(previousGameplay.endTime))
                          .toList();
                    } else if (value is GameplayResultModel) {
                      final List<PlayerResultModel> playerResultList = value.playerResultList;

                      if (playerResultList.isEmpty) {
                        return Center(
                          child: SelectableText(
                            'Jogadores não encontrados!',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        );
                      }

                      length = playerResultList.length;

                      memoryGameList = List.filled(length, value.memoryGame);

                      scoreList =
                          playerResultList.map((playerResult) => playerResult.score).toList();

                      usernameList =
                          playerResultList.map((playerResult) => playerResult.player).toList();

                      numberRightOptionsList = playerResultList
                          .map((playerResult) => playerResult.numberRightOptions)
                          .toList();

                      numberWrongOptionsList = playerResultList
                          .map((playerResult) => playerResult.numberWrongOptions)
                          .toList();

                      numberAttemptsList = playerResultList
                          .map((playerResult) => playerResult.numberAttempts)
                          .toList();

                      startTimeList = playerResultList
                          .map((playerResult) => DateUtil.formatToString(playerResult.startTime))
                          .toList();

                      endTimeList = playerResultList
                          .map((playerResult) => DateUtil.formatToString(playerResult.endTime))
                          .toList();
                    } else if (value is PlayerResultModel) {
                      length = 1;
                      memoryGameList = [''];
                      scoreList = [value.score];
                      usernameList = [value.creator];
                      numberRightOptionsList = [value.numberRightOptions];
                      numberWrongOptionsList = [value.numberWrongOptions];
                      numberAttemptsList = [value.numberAttempts];
                      startTimeList = [DateUtil.formatToString(value.startTime)];
                      endTimeList = [DateUtil.formatToString(value.endTime)];
                    } else {
                      SnackBarUtil.showSnackBar(context,
                          CustomSnackBarWidget.forError(CustomException.anyError().message));

                      return const SizedBox.shrink();
                    }

                    String tipoUsuario = '';
                    if (viewModel.scoreType == ScoreTypeEnum.previousGameplayByCreator ||
                        viewModel.scoreType == ScoreTypeEnum.currentGameplayByPlayer ||
                        viewModel.scoreType == ScoreTypeEnum.currentGameplayByCreator) {
                      tipoUsuario = 'Jogador';
                    } else if (viewModel.scoreType == ScoreTypeEnum.previousGameplayByPlayer ||
                        viewModel.scoreType == ScoreTypeEnum.onePlayerGameplay) {
                      tipoUsuario = 'Criador';
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
                                Visibility(
                                  visible: !(value is PlayerResultModel),
                                  child: SelectableText(
                                    'Jogo de memória: ${memoryGameList[index]}',
                                    style: Theme.of(context).textTheme.headlineMedium,
                                  ),
                                ),
                                SelectableText(
                                  'Pontuação: ${scoreList[index]} pontos',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                                SelectableText(
                                  '$tipoUsuario: ${usernameList[index]}',
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
                                SelectableText(
                                  'Começo: ${startTimeList[index]}',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                                SelectableText(
                                  'Fim: ${endTimeList[index]}',
                                  style: Theme.of(context).textTheme.headlineMedium,
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
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: (viewModel.scoreType == ScoreTypeEnum.currentGameplayByPlayer ||
                          viewModel.scoreType == ScoreTypeEnum.currentGameplayByCreator),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: viewModel.onPressedReload(context),
                            child: const Text('Recarregar'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: viewModel.scoreType == ScoreTypeEnum.previousGameplayByCreator ||
                          viewModel.scoreType == ScoreTypeEnum.currentGameplayByCreator,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => context.popRoute(),
                            child: const Text('Voltar'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: viewModel.onPressedBackToDashboard(context),
                      child: const Text('Voltar para dashboard'),
                    ),
                  ],
                )
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
      ),
    );
  }
}
