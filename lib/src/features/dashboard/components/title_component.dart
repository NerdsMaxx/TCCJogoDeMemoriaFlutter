import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
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
                  onPressed: () {
                   
                  },
                  icon: Icons.history_sharp,
                ),
                Visibility(
                  visible: getIt<Auth>().isCreator(),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      CircleButtonWidget(
                        tooltip: 'Acompanhar as partidas',
                        onPressed: viewModel.onPressedGameplayManagement,
                        icon: Icons.data_thresholding_outlined,
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
