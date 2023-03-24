import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/features/dashboard/contexts/dashboard_context.dart';
import 'package:memory_game_web/src/routes/routes.gr.dart';
import 'package:memory_game_web/src/widgets/circle_button_widget.dart';
import 'package:memory_game_web/src/widgets/custom_text_field_form_widget.dart';

part 'title_component_logic.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _TitleComponentLogic logic = _TitleComponentLogic();

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
                  onPressed: logic.onPressedCodeEntry(context),
                  icon: Icons.sensor_door_outlined,
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
                        onPressed: logic.onPressedGameplayManagement(context),
                        icon: Icons.data_thresholding_outlined,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      CircleButtonWidget(
                        tooltip: 'Criar um jogo de memória',
                        onPressed: logic.onPressedAdding(context),
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
