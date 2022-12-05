import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jogo_de_memoria_flutter/src/components/add_button_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar_component.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_title_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/creation_tool/components/create_or_edit/first_step_component.dart';
import 'package:jogo_de_memoria_flutter/src/features/dashboard/components/card_dashboard_component.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/repositories/memory_game_repository.dart';
import 'package:jogo_de_memoria_flutter/src/utils/size_util.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final Future<List<String>> _memoryGameNameListFuture =
      MemoryGameRepository.getAllMemoryGameNameByUsername();

  VoidCallback onTapCreationMode(String memoryGameName) => () async {
        List<CreateOrEditCardFirstStepComponent>? cardsWidget = [];

        List<CardModel> cardList =
            await MemoryGameRepository.getAllCardByMemoryGameName(memoryGameName);

        for (CardModel card in cardList) {
          cardsWidget.add(
            CreateOrEditCardFirstStepComponent(
              key: card.id,
              card: card,
            ),
          );
        }

        // ignore: use_build_context_synchronously
        context.go(
          '/creation_tool',
          extra: {
            'name': memoryGameName,
            'cardsWidget': cardsWidget,
          },
        );
      };

  VoidCallback onTapGameMode(String memoryGameName) => () async {
        List<CardModel> cardList =
            await MemoryGameRepository.getAllCardByMemoryGameName(memoryGameName);

        // ignore: use_build_context_synchronously
        context.go(
          '/memory_game',
          extra: cardList,
        );
      };

  @override
  Widget build(BuildContext context) {
    return CustomAppBarComponent(
      showHomeButton: false,
      body: FutureBuilder(
        future: _memoryGameNameListFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox.shrink();
          }

          final List<String> memoryGameNameList = snapshot.data!;

          return Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: getWidth(context, 0.9),
              //height: getHeight(context, 0.8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomTitleComponent(
                          title: 'Seus jogos de memória',
                        ),
                        AddButtonComponent(
                          onPressed: () => context.go('/creation_tool'),
                          size: 42,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            spacing: 45,
                            runSpacing: 50,
                            children: memoryGameNameList
                                .map<Widget>(
                                  (name) => CardDashboardComponent(
                                    name: name,
                                    onTapCreationMode: onTapCreationMode,
                                    onTapGameMode: onTapGameMode,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
