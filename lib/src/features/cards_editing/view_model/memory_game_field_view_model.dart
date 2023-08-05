import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:memory_game_web/injection.dart';
import 'package:memory_game_web/src/auth/auth.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/features/cards_editing/context/memory_game_editing_context.dart';
import 'package:memory_game_web/src/models/card_model.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/services/memory_game_service.dart';
import 'package:memory_game_web/src/utils/snack_bar_util.dart';
import 'package:memory_game_web/src/widgets/custom_snack_bar_widget.dart';

class MemoryGameFieldViewModel {
  MemoryGameFieldViewModel(this.context) {
    memoryGameEditingContext = MemoryGameEditingContext.of(context)!;
    memoryGameName = memoryGameEditingContext.memoryGameName;
    subjects = memoryGameEditingContext.subjectList.join(', ');
  }

  void updateContext(BuildContext context) {
    this.context = context;
  }

  BuildContext context;
  late final MemoryGameEditingContext memoryGameEditingContext;

  final Auth auth = getIt<Auth>();
  final MemoryGameService memoryGameService = getIt<MemoryGameService>();

  final formKey = GlobalKey<FormState>();
  final validatorMemoryGameName =
      ValidationBuilder(requiredMessage: 'Deve escrever nome do jogo de memória')
          .minLength(2, 'Deve ser escrito no mínimo dois caracteres')
          .build();

  late String memoryGameName;
  late String subjects;

  void onChangedMemoryGameName(String value) {
    memoryGameEditingContext.memoryGameName = value;
  }

  void onChangedSubject(String value) {
    subjects = value;
    memoryGameEditingContext.subjectList = value.split(',').map((e) => e.trim()).toList();
  }

  void onPressedSave() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (memoryGameEditingContext.cardEditingList.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SnackBarUtil.showSnackBar(
          context,
          CustomSnackBarWidget.forError('Não foram criadas as cartas.'),
        );
      });

      return;
    }

    Set<int> hashCodeSet = {};

    final List<CardModel> cardList = memoryGameEditingContext.cardEditingList
        .where((cardEditing) {
          if (hashCodeSet.contains(cardEditing.hashCode)) {
            return false;
          }

          hashCodeSet.addAll([cardEditing.hashCode, cardEditing.otherCard.hashCode]);
          return true;
        })
        .map((cardEditing) => CardModel(
              firstContent: cardEditing.content,
              secondContent: cardEditing.otherCard.content,
            ))
        .toList();

    final MemoryGameModel memoryGame = MemoryGameModel(
      name: MemoryGameEditingContext.of(context)!.memoryGameName,
      creator: auth.username!,
      subjectList: MemoryGameEditingContext.of(context)!.subjectList,
      cardList: cardList,
    );
    try {
      if (memoryGameEditingContext.isNewMemoryGame) {
        await memoryGameService.saveMemoryGame(memoryGame);
      } else {
        await memoryGameService.updateMemoryGame(
          memoryGameEditingContext.oldMemoryGameName!,
          memoryGame,
        );
      }

      memoryGameEditingContext.showSavedMemoryGame.value = true;
    } on CustomException catch (customException) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SnackBarUtil.showSnackBar(
          context,
          CustomSnackBarWidget.forError(customException.toString()),
        );
      });
    }
  }
}