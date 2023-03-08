import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';
import 'package:memory_game_web/src/widgets/card_widget.dart';

class CardEditingComponent extends StatefulWidget {
  CardEditingComponent({
    super.key,
    required this.cardEditing,
    this.isFirst = false,
  });

  final CardEditingModel cardEditing;
  bool isFirst;

  @override
  State<CardEditingComponent> createState() => _CardEditingComponentState();
}

class _CardEditingComponentState extends State<CardEditingComponent> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final validatorContent = ValidationBuilder(requiredMessage: 'É obrigatório escrever um conteúdo!')
      .minLength(1, 'Deve ter no mínimo um caracter')
      .build();
  final ValueNotifier<bool> editing = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      child: Form(
        key: formKey,
        child: ValueListenableBuilder(
          valueListenable: editing,
          builder: (context, editingValue, _) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180,
                height: 180,
                child: TextFormField(
                  initialValue: widget.cardEditing.content,
                  autofocus: true,
                  style: Theme.of(context).textTheme.headlineLarge,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  maxLines: 6,
                  onChanged: ((value) => widget.cardEditing.content = value),
                  validator: validatorContent,
                  readOnly: !editingValue,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (!widget.isFirst && !formKey.currentState!.validate()) {
                    return;
                  }

                  widget.isFirst = false;
                  editing.value = !editing.value;
                },
                child: Text((!editingValue) ? 'Editar' : 'Aplicar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
