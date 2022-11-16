import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:jogo_de_memoria_flutter/src/components/add_button_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/dashboard/components/card_dashboard_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_title_component.dart';
import 'package:jogo_de_memoria_flutter/src/utils/size_util.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBarComp(
      showHomeButton: false,
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: getWidth(context, 0.9),
          height: getHeight(context, 0.8),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTitleComp(
                    title: 'Seus jogos de memória',
                  ),
                  AddButtonComp(
                    onPressed: () => context.push('/creation_tool'),
                    size: 42,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: const [CardDashboardComp()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
