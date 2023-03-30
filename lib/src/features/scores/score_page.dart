import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/scores/score_view_model.dart';
import 'package:memory_game_web/src/models/gameplay_result_model.dart';
import 'package:memory_game_web/src/models/previous_gameplays_model.dart';
import 'package:memory_game_web/src/utils/size_util.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({
    super.key,
    this.code,
    this.isPlayer = false,
  });

  final String? code;
  final bool isPlayer;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  late final ScoreViewModel viewModel = ScoreViewModel(context, widget.isPlayer, widget.code);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      back: true,
      body: Center(
        child: CustomFutureBuilderWidget<Object, Object, Object>(
          future: viewModel.futureGameplayResult,
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
                  int length = 0;
                  List<int> scores = [];
                  List<String> usernames = [];

                  if (widget.isPlayer) {
                    final List<PreviousGameplaysModel> previousGameplayList =
                        value as List<PreviousGameplaysModel>;

                    length = previousGameplayList.length;
                    scores = previousGameplayList
                        .map((previousGameplay) => previousGameplay.score)
                        .toList();
                    usernames = previousGameplayList
                        .map((previousGameplay) => previousGameplay.creator)
                        .toList();
                  } else {
                    final GameplayResultModel gameplayResult = value as GameplayResultModel;

                    length = gameplayResult.playerResultList.length;
                    scores = gameplayResult.playerResultList.map((playerResult) => playerResult.score).toList();
                    usernames = gameplayResult.playerResultList.map((playerResult) => playerResult.player).toList();
                  }

                  return ListView.builder(
                    itemCount: length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        CustomContainerWidget(
                          child: ListTile(
                            title: SelectableText(
                              '${scores[index]} pontos',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            subtitle: SelectableText(
                              usernames[index],
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            trailing: const Icon(
                              Icons.play_circle_outline_rounded,
                              size: 46,
                            ),
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
                height: 20,
              ),
              Visibility(
                visible: () {
                  if (value is GameplayResultModel) {
                    return !value.allFinished;
                  }

                  return false;
                }(),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: viewModel.onPressedReload(context),
                      child: const Text('Recarregar'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: viewModel.onPressedBackToDashboard(context),
                child: const Text('Voltar para dashboard'),
              ),
            ],
          ),
          onError: (context, error) => SelectableText(error.toString()),
        ),
      ),
    );
  }
}
