import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class CardEditingViewModel {
  CardEditingViewModel();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final validatorContent = ValidationBuilder(requiredMessage: 'É obrigatório escrever um conteúdo!')
      .minLength(1, 'Deve ter no mínimo um caracter')
      .build();
}
