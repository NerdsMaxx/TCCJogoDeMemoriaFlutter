import 'package:flutter/material.dart';
import 'package:memory_game_web/src/features/cards_editing/models/card_editing_model.dart';

class CardsAddingController {
  final ValueNotifier<bool> showEditableCard = ValueNotifier(false);
  final List<CardEditingModel> cardEditingList = [];
}
