import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/dtos/gameplay_dto.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/dashboard/components/card_component/card_component.dart';
import 'package:memory_game_web/src/features/dashboard/components/title/title_component.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';

part 'main_dashboard_component_logic.dart';

class MainDashboardComponent extends StatelessWidget {
  const MainDashboardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final _MainDashboardComponentLogic logic = _MainDashboardComponentLogic();

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const TitleComponent(),
        const SizedBox(
          height: 50,
        ),
        CustomFutureBuilderWidget<List<MemoryGameDto>, List<MemoryGameDto>, Object>(
          future: logic.futureMemoryGameDtoList,
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
          onData: (context, data) => Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(
                spacing: 30,
                runSpacing: 30,
                children: [
                  for (MemoryGameDto memoryGameDto in data)
                    CardComponent(
                      memoryGameDto: memoryGameDto
                    )
                ],
              ),
            ),
          ),
          onError: (context, error) => SelectableText(error.toString()),
        ),
      ],
    );
  }
}
