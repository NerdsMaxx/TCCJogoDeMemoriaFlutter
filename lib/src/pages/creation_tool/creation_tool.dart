import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/app_bar.dart';
import 'package:jogo_de_memoria_flutter/src/pages/creation_tool/components/create_card.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_title.dart';
import 'package:jogo_de_memoria_flutter/src/components/grid_card.dart';
import 'package:jogo_de_memoria_flutter/src/models/card.dart';
import 'package:jogo_de_memoria_flutter/src/notifiers/card.dart';
import 'package:jogo_de_memoria_flutter/src/utils/generate_card.dart';

class CreationTool extends StatefulWidget {
  const CreationTool({super.key});

  @override
  State<CreationTool> createState() => _CreationToolState();
}

class _CreationToolState extends State<CreationTool> {
  final List<CreateCard> _cardsWidget = [];
  late final CardNotifier _cardNotifier;
  bool _isFirstTime = true;

  CreateCard _createCardWidget() {
    return CreateCard(
      key: UniqueKey(),
      card: GenerateCard.execute(),
      cardNotifier: _cardNotifier,
    );
  }

  @override
  void initState() {
    super.initState();

    CardModel card = GenerateCard.execute();

    _cardNotifier = CardNotifier(card);

    _cardsWidget.add(
      CreateCard(
        key: UniqueKey(),
        cardNotifier: _cardNotifier,
        card: card,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const CustomTitle(
            title: 'Criação de jogo de memória',
          ),
          const SizedBox(
            height: 30,
          ),
          ValueListenableBuilder<CardModel>(
            valueListenable: _cardNotifier,
            builder: (_, __, ___) {
              if (!_isFirstTime) {
                if (_cardNotifier.card.isActive) {
                  _cardsWidget.add(_createCardWidget());
                } else {
                  _cardsWidget
                      .removeWhere((cardWidget) => cardWidget.card.id == _cardNotifier.card.id);

                  if (_cardsWidget.isEmpty) {
                    _cardsWidget.add(_createCardWidget());
                  }
                }
              }

              _isFirstTime = false;

              return GridCards(cards: _cardsWidget);
            },
          ),
        ],
      ),
    );
  }
}
