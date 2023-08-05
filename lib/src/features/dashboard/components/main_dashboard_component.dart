import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/dashboard/components/card_component.dart';
import 'package:memory_game_web/src/features/dashboard/components/search_component.dart';
import 'package:memory_game_web/src/features/dashboard/components/title_component.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/features/dashboard/view_model/main_dashboard_view_model.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';
import 'package:memory_game_web/src/widgets/loading_widget.dart';

class MainDashboardComponent extends StatelessWidget {
  const MainDashboardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final MainDashboardViewModel viewModel = MainDashboardViewModel(context);

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const TitleComponent(),
        const SizedBox(
          height: 20,
        ),
        const SearchComponent(),
        const SizedBox(
          height: 30,
        ),
        ValueListenableBuilder(
          valueListenable: DashboardContext.of(context)!.reloadMemoryGameList,
          builder: (_, __, ___) =>
              CustomFutureBuilderWidget<List<MemoryGameModel>, List<MemoryGameModel>>(
            future: DashboardContext.of(context)!.futureMemoryGameList,
            onLoading: (context) => const LoadingWidget(),
            onData: (context, data) => Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Visibility(
                      visible: data.isNotEmpty,
                      child: Wrap(
                        spacing: 30,
                        runSpacing: 30,
                        children: [
                          for (MemoryGameModel memoryGameModel in data)
                            CardComponent(memoryGame: memoryGameModel)
                        ],
                      ),
                    ),
                    Visibility(
                      visible: data.isEmpty,
                      child: Center(
                        child: SelectableText(
                          (viewModel.dashboardContext.searchForCreator)
                              ? 'Crie seu jogo de memória agora : ) !'
                              : 'Não jogou jogo de memória, tente encontrar um código ; )',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            onError: (context, error) => Center(
              child: SelectableText(
                error.toString(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}