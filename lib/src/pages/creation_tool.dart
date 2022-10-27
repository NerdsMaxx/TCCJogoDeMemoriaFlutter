import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/create_card.dart';
import 'package:jogo_de_memoria_flutter/src/models/card.dart';
import 'package:jogo_de_memoria_flutter/src/notifiers/card.dart';
import 'package:jogo_de_memoria_flutter/src/utils/card.dart';

class CreationTool extends StatefulWidget {
  const CreationTool({super.key});

  @override
  State<CreationTool> createState() => _CreationToolState();
}

class _CreationToolState extends State<CreationTool> {
  List<CreateCard> _cardsWidget = [];
  final CardNotifier _cardNotifier = CardNotifier(CardModel(id: 1));
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();

    _cardsWidget.add(CreateCard(
      cardNotifier: _cardNotifier,
      card: GenerateCard.execute(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<CardModel>(
        valueListenable: _cardNotifier,
        builder: (_, __, ___) {
          if (!_isFirstTime) {
            if (_cardNotifier.card.isActive) {
              _cardsWidget.add(
                CreateCard(
                  cardNotifier: _cardNotifier,
                  card: GenerateCard.execute(),
                ),
              );
            } else {
              _cardsWidget = _cardsWidget.where((cardWidget) {
                if (cardWidget.card.id != _cardNotifier.card.id) {
                  return true;
                }

                debugPrint('ID É DO CARD WIDGET:${cardWidget.card.id}');
                return false;
              }).toList();

              debugPrint('${_cardNotifier.card.id}');
            }
          }

          _isFirstTime = false;

          debugPrint(_cardsWidget.fold('', (previousValue, element) {
            return '$previousValue ${element.card.id}';
          }));

          return FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.8,
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: _cardsWidget,
            ),
          );
        },
      ),
    );
  }
}
