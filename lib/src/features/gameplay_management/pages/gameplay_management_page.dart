import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/models/codes_model.dart';
import 'package:memory_game_web/src/models/gameplay_result_model.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/services/gameplay_service.dart';
import 'package:memory_game_web/src/utils/size_util.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_container_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';

part 'gameplay_management_page_logic.dart';

class GameplayManagementPage extends StatelessWidget {
  const GameplayManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _GameplayManagementPageLogic logic = _GameplayManagementPageLogic();

    return AppBarWidget(
      back: true,
      body: Center(
        child: CustomFutureBuilderWidget<CodesModel, CodesModel, Object>(
          future: logic.futureCodes,
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
                'Códigos',
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
                  itemCount: value.codes.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      CustomContainerWidget(
                        child: ListTile(
                          title: SelectableText(
                            value.codes[index].code!,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          subtitle: SelectableText(
                            value.codes[index].name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          trailing: ElevatedButton(
                            onPressed: logic.onPressedScore(
                              context,
                              value.codes[index].code!,
                            ),
                            child: const Text('Acompanhar'),
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
                onPressed: logic.onPressedReload,
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
