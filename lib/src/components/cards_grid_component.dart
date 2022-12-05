import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/utils/size_util.dart';

class CardsGridComponent extends StatelessWidget {
  const CardsGridComponent({
    super.key,
    required this.cards,
  });
  
  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: getWidth(context, 0.9),
        height: getHeight(context, 0.7),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: cards,
          ),
        ),
      ),
    );
  }
}
