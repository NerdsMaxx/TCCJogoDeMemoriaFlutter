import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/gameplay_result_model.dart';
import 'package:memory_game_web/src/models/previous_gameplays_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';
import 'package:memory_game_web/src/utils/size_util.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';

part 'score_page_logic.dart';

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
  late final _ScorePageLogic logic = _ScorePageLogic(widget.code, widget.isPlayer);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      back: true,
      body: Center(
        child: CustomFutureBuilderWidget<Object, Object, Object>(
          future: logic.futureGameplayResult,
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

                  if (value is GameplayResultModel) {
                    length = value.playerResultList.length;
                    scores = value.playerResultList.map((e) => e.score).toList();
                    usernames = value.playerResultList.map((e) => e.player).toList();
                  } else if (value is List<PreviousGameplaysModel>) {
                    length = value.length;
                    scores = value.map((e) => e.score).toList();
                    usernames = value.map((e) => e.creator).toList();
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
                      onPressed: logic.onPressedReload(context),
                      child: const Text('Recarregar'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: logic.onPressedBackToDashboard(context),
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
