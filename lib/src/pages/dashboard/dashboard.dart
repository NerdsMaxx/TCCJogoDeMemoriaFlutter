import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:jogo_de_memoria_flutter/src/components/add_button.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar.dart';
import 'package:jogo_de_memoria_flutter/src/pages/dashboard/components/card_dashboard.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_title.dart';
import 'package:jogo_de_memoria_flutter/src/utils/size.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
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
                  const CustomTitle(
                    title: 'Seus jogos de memória',
                  ),
                  AddButton(
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
                  children: const [
                    CardDashboard()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
