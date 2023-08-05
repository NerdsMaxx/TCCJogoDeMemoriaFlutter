import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/dashboard/view_model/title_view_model.dart';
import 'package:memory_game_web/src/widgets/circle_button_widget.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TitleViewModel viewModel = TitleViewModel(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SelectableText(
              'Seus jogos de memória',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  child: Row(
                    children: [
                      Visibility(
                        visible: viewModel.isPlayer && viewModel.isCreator,
                        child: Row(
                          children: [
                            CircleButtonWidget(
                              tooltip: 'Mostrar jogo de memória já jogados salvos',
                              onPressed: viewModel.onPressedMemoryGamePlayer,
                              icon: Icons.save,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: viewModel.isPlayer && viewModel.isCreator,
                        child: Row(
                          children: [
                            CircleButtonWidget(
                              tooltip: 'Mostrar jogo de memória criados',
                              onPressed: viewModel.onPressedMemoryGameCreator,
                              icon: Icons.casino_rounded,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: viewModel.isPlayer,
                  child: Row(
                    children: [
                      CircleButtonWidget(
                        tooltip: 'Entrar pelo código',
                        onPressed: viewModel.onPressedCodeEntry,
                        icon: Icons.sensor_door_outlined,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CircleButtonWidget(
                        tooltip: 'Olhar histórico de outras jogadas',
                        onPressed: viewModel.onPressedHistoryGameplay,
                        icon: Icons.history_sharp,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: viewModel.isPlayer && viewModel.isCreator,
                  child: const SizedBox(
                    width: 20,
                  ),
                ),
                Visibility(
                  visible: viewModel.isCreator,
                  child: Row(
                    children: [
                      CircleButtonWidget(
                        tooltip: 'Acompanhar as partidas atuais',
                        onPressed: viewModel.onPressedGameplayManagement(true),
                        icon: Icons.data_thresholding_outlined,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CircleButtonWidget(
                        tooltip: 'Olhar histórico de outras partidas criadas',
                        onPressed: viewModel.onPressedGameplayManagement(),
                        icon: Icons.analytics,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CircleButtonWidget(
                        tooltip: 'Criar um jogo de memória',
                        onPressed: viewModel.onPressedAdding,
                        icon: Icons.add,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}