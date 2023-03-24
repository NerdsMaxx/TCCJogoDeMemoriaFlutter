import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/features/gameplay/contexts/memory_game_gameplay_context.dart';
import 'package:memory_game_web/src/local_storage/keys.dart';
import 'package:memory_game_web/src/local_storage/local_storage.dart';
import 'package:memory_game_web/src/models/gameplay_result_model.dart';
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
  });

  final String? code;

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  late final _ScorePageLogic logic = _ScorePageLogic(widget.code);

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      back: true,
      body: Center(
        child: CustomFutureBuilderWidget<GameplayResultModel, GameplayResultModel, Object>(
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
                child: ListView.builder(
                  itemCount: value.playerResultList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      CustomContainerWidget(
                        child: ListTile(
                          title: SelectableText(
                            '${value.playerResultList[index].score} pontos',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          subtitle: SelectableText(
                            value.playerResultList[index].player,
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: logic.onPressedReload(context),
                child: const Text('Recarregar'),
              ),
              const SizedBox(
                height: 20,
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
