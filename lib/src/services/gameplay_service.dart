import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/src/abstract_classes/service_abs.dart';
import 'package:memory_game_web/src/api/http_impl.dart';
import 'package:memory_game_web/src/dtos/gameplay_dto.dart';
import 'package:memory_game_web/src/dtos/gameplay_result_dto.dart';
import 'package:memory_game_web/src/dtos/player_added_dto.dart';
import 'package:memory_game_web/src/dtos/player_score_dto.dart';

@injectable
class GameplayService extends Service {
  const GameplayService(super.auth, @Named.from(HttpImpl) super.http);

  static const String path = 'gameplay';

  Future<PlayerAddedDto> enterInGameplay(String code) async {
    Response response = await http.post('$path/jogar/$code', auth: auth);
    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      debugPrint(json.toString());
      return PlayerAddedDto.fromJson(json);
    }

    throw Exception('Não foi possível encontrar um jogo com este código!');
  }

  Future<GameplayResultDto> finishGameplay(String code, PlayerScoreDto playerScoreDto) async {
    Response response = await http.post('$path/terminar/$code', body: playerScoreDto.toJson());
    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      return GameplayResultDto.fromJson(json);
    }

    throw Exception('Não foi possível obter o resultado do jogo!');
  }

  Future<GameplayDto> generateGameplay(String memoryGame, [String? creatorName]) async {
    Response response = await http.post(
      '$path/comecar',
      body: {
        'memoryGame': memoryGame,
        'creator': creatorName,
      },
      auth: auth,
    );

    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      return GameplayDto.fromJson(json);
    }

    throw Exception('Não foi possível gerar gameplay!');
  }
}
