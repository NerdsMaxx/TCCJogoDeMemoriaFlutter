import 'dart:convert';
import 'dart:io' show HttpHeaders;

import 'package:jogo_de_memoria_flutter/src/api/api.dart';
import 'package:jogo_de_memoria_flutter/src/api/url_api.dart';
import 'package:jogo_de_memoria_flutter/src/auth/auth.dart';
import 'package:jogo_de_memoria_flutter/src/enums/type_card.dart';
import 'package:jogo_de_memoria_flutter/src/models/card_model.dart';

import 'package:http/http.dart' as http;

class MemoryGameRepository {
  Future<List<String>> getAllMemoryGameNameByUsername() async {
    Auth auth = Auth.instance();

    String body = (await Api.get(auth.username)).body;

    List<Map<String, dynamic>> result = jsonDecode(body) as List<Map<String, dynamic>>;

    List<String> memoryGameNameList =
        result.map<String>((element) => element['name']! as String).toList(growable: false);

    return memoryGameNameList;
  }

  Future<List<CardModel>> getAllCardByMemoryGameName(final String memoryGameName) async {
    Auth auth = Auth.instance();

    String body = (await Api.get(auth.username)).body;

    Map<String, dynamic> result = jsonDecode(body) as Map<String, dynamic>;

    List<Map<String, String>> cardMapList = result['cards']! as List<Map<String, String>>;

    List<CardModel> cardList = [];
    for (Map<String, String> cardMap in cardMapList) {
      final CardModel questionCard = CardModel(
        phrase: cardMap['question']!,
        typeCard: TypeCardEnum.question,
      );

      final CardModel answerCard = CardModel(
        phrase: cardMap['answer']!,
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
