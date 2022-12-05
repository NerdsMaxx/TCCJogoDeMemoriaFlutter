import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';

class CardDashboardComponent extends StatelessWidget {
  const CardDashboardComponent({
    super.key,
    required this.name,
    required this.onTapCreationMode,
    required this.onTapGameMode,
  });

  final String name;
  final VoidCallback Function(String) onTapCreationMode;
  final VoidCallback Function(String) onTapGameMode;

  @override
  Widget build(BuildContext context) {
    const double sizeFactor = 0.8;

    return GestureDetector(
      onTap: onTapCreationMode(name),
      child: Column(
        children: [
          SizedBox(
            height: 340 * sizeFactor,
            child: CustomCardComponent(
              sizeFactor: sizeFactor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: onTapCreationMode(name),
                    child: const Text(
                      'Editar',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: onTapGameMode(name),
                    child: const Text(
                      'Jogar',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SelectableText(
            name,
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
        ],
      ),
    );
  }
}
