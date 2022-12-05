import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/features/memory_game/notifier/face_card_count_notifier.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';
import 'package:jogo_de_memoria_flutter/src/models/optional_model.dart';

// ignore: must_be_immutable
class MemoryGameContext extends InheritedWidget {
  MemoryGameContext({
    super.key,
    required this.faceCardCountNotifier,
    required this.optionalFirstCard,
    required this.optionalSecondCard,
    required this.optionalTemporaryCard,
    required super.child,
  });

  FaceCardCountNotifier faceCardCountNotifier;
  OptionalModel<CardModel> optionalFirstCard;
  OptionalModel<CardModel> optionalSecondCard;
  OptionalModel<CardModel> optionalTemporaryCard;

  static MemoryGameContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MemoryGameContext>();
  }

  @override
  bool updateShouldNotify(MemoryGameContext oldWidget) => false;
}
