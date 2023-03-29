import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';
import 'package:memory_game_web/src/features/cards_editing/view_model/card_editing_view_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';

class CardEditingComponent extends StatefulWidget {
  const CardEditingComponent({
    super.key,
    required this.cardEditing,
  });

  final CardEditingModel cardEditing;

  @override
  State<CardEditingComponent> createState() => _CardEditingComponentState();
}

class _CardEditingComponentState extends State<CardEditingComponent> {
  late final CardEditingViewModel viewModel = CardEditingViewModel();

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 180,
              height: 260,
              child: TextFormField(
                initialValue: widget.cardEditing.content,
                autofocus: true,
                style: Theme.of(context).textTheme.headlineLarge,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: 6,
                onChanged: ((value) => widget.cardEditing.content = value),
                validator: viewModel.validatorContent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
