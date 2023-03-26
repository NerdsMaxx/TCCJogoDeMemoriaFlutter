import 'dart:js';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class MemoryGameEditingViewModel {
  static late final MemoryGameEditingViewModel instance;
  
  static dispose() {
    instance.formKeyCardEditing.currentState!.dispose();
  }

  MemoryGameEditingViewModel(this.context) {
    instance = this;
  }

  

  final BuildContext context;

  final GlobalKey<FormState> formKeyCardEditing = GlobalKey<FormState>();
  final validatorContent = ValidationBuilder(requiredMessage: 'É obrigatório escrever um conteúdo!')
      .minLength(1, 'Deve ter no mínimo um caracter')
      .build();
}
