part of 'card_editing_component.dart';

class _CardEditingComponentLogic {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final validatorContent = ValidationBuilder(requiredMessage: 'É obrigatório escrever um conteúdo!')
      .minLength(1, 'Deve ter no mínimo um caracter')
      .build();
}
