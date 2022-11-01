import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card.dart';

class CardDashboard extends StatelessWidget {
  const CardDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    const double sizeFactor = 0.6;

    return SizedBox(
      width: 240 * sizeFactor,
      height: 340 * sizeFactor,
      child: Stack(children: const [
        Align(
          alignment: Alignment.bottomRight,
          child: CustomCard(
            sizeFactor: sizeFactor,
            child: SizedBox.shrink(),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomCard(
            sizeFactor: sizeFactor,
            child: SizedBox.shrink(),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: CustomCard(
            sizeFactor: sizeFactor,
            child: SizedBox.shrink(),
          ),
        ),
      ]),
    );
  }
}
