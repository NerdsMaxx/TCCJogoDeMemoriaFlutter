import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';

class CardDashboardComp extends StatelessWidget {
  const CardDashboardComp({super.key});

  @override
  Widget build(BuildContext context) {
    const double sizeFactor = 0.6;

    return SizedBox(
      width: 240 * sizeFactor,
      height: 340 * sizeFactor,
      child: Stack(children: const [
        Align(
          alignment: Alignment.bottomRight,
          child: CustomCardComp(
            sizeFactor: sizeFactor,
            child: SizedBox.shrink(),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomCardComp(
            sizeFactor: sizeFactor,
            child: SizedBox.shrink(),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: CustomCardComp(
            sizeFactor: sizeFactor,
            child: SizedBox.shrink(),
          ),
        ),
      ]),
    );
  }
}
