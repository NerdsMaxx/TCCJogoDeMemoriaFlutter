import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jogo_de_memoria_flutter/src/api/api.dart';
import 'package:jogo_de_memoria_flutter/src/auth/auth.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

abstract class MemoryGameRepository {
  static Future<List<String>> getAllMemoryGameNameByUsername() async {
    String username = await Auth.instance().username;

    String body = (await Api.get('memory-game/memory-game-name/$username')).body;

    dynamic decodeResult = jsonDecode(body);

    List<String> memoryGameNameList =
        decodeResult.map<String>((memoryGameName) => memoryGameName as String).toList();

    return memoryGameNameList
        .map((memoryGameName) => const Utf8Decoder().convert(memoryGameName.codeUnits))
        .toList();
  }

  static Future<List<CardModel>> getAllCardByMemoryGameName(final String memoryGameName) async {
    String username = await Auth.instance().username;

    String body = (await Api.get('memory-game/$username/$memoryGameName')).body;
    debugPrint(body);

    dynamic decodeResult = jsonDecode(body);

    List<dynamic> cardMapList = decodeResult['cards']!;

    List<CardModel> cardList = [];
    for (dynamic cardMap in cardMapList) {
      final CardModel questionCard = CardModel(
        phrase: const Utf8Decoder().convert((cardMap['question']! as String).codeUnits),
        typeCard: TypeCardEnum.question,
      );

      final CardModel answerCard = CardModel(
        phrase: const Utf8Decoder().convert((cardMap['answer']! as String).codeUnits),
        typeCard: TypeCardEnum.answer,
      );

      questionCard.otherCard = answerCard;
      answerCard.otherCard = questionCard;

      cardList.addAll([
        questionCard,
        answerCard,
      ]);
    }

    return cardList;
  }
}
