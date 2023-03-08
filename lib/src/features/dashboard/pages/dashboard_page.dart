import 'package:flutter/material.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/features/dashboard/components/card_component.dart';
import 'package:memory_game_web/src/features/dashboard/components/title_component.dart';
import 'package:memory_game_web/src/features/dashboard/controller/dashboard_controller.dart';
import 'package:memory_game_web/src/widgets/app_bar_widget.dart';
import 'package:memory_game_web/src/widgets/custom_future_builder_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController _controller = DashboardController();

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TitleComponent(
              onPressedAdding: _controller.onPressedAdding(context),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomFutureBuilderWidget<List<MemoryGameDto>, List<MemoryGameDto>, String>(
              future: _controller.futureMemoryGameDtoList,
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
                          text: memoryGameDto.name,
                          onPressedGameplay: _controller.onPressedGameplay(context),
                          onPressedEditing: _controller.onPressedEditing(context, memoryGameDto),
                        )
                    ],
                  ),
                ),
              ),
              onError: (context, error) => SelectableText(error ?? 'ERRO!!!'),
            ),
          ],
        ),
      ),
    );
  }
}
