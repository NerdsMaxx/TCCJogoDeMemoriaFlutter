import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/components/custom_card_component.dart';

class CreateOrEditCardFirstStepComp extends StatefulWidget {
  const CreateOrEditCardFirstStepComp({
    super.key,
    required this.showCreation,
  });

  final ValueNotifier<bool> showCreation;

  @override
  State<CreateOrEditCardFirstStepComp> createState() => _CreateOrEditCardFirstStepCompState();
}

class _CreateOrEditCardFirstStepCompState extends State<CreateOrEditCardFirstStepComp> {
  @override
  Widget build(BuildContext context) {
    return CustomCardComp(
      key: UniqueKey(),
      child: TextButton(
        child: const Text(
          '+',
          style: TextStyle(
            fontSize: 64,
          ),
        ),
        onPressed: () => widget.showCreation.value = !widget.showCreation.value,
      ),
    );
  }
}
