import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

// ignore: must_be_immutable
class MemoryGameContext extends InheritedWidget {
  MemoryGameContext({
    super.key,
    required this.faceCardCountNotifier,
    this.firstCard,
    this.secondCard,
    required super.child,
  });

  ValueNotifier<int> faceCardCountNotifier;
  CardModel? firstCard;
  CardModel? secondCard;

  static MemoryGameContext? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MemoryGameContext>();
  }

  @override
  bool updateShouldNotify(MemoryGameContext oldWidget) => false;
}
