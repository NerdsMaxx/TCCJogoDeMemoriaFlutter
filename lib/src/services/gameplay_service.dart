import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/src/abstract_classes/service_abs.dart';
import 'package:memory_game_web/src/api/http_impl.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/models/codes_model.dart';
import 'package:memory_game_web/src/models/gameplay_model.dart';
import 'package:memory_game_web/src/models/gameplay_result_model.dart';
import 'package:memory_game_web/src/models/player_added_model.dart';
import 'package:memory_game_web/src/models/player_score_model.dart';

@injectable
class GameplayService extends Service {
  const GameplayService(super.auth, @Named.from(HttpImpl) super.http);

  static const String path = 'gameplay';

  Future<GameplayModel> generateGameplay(GameplayModel gameplay) async {
    Response response = await http.post(
      '$path/comecar',
      body: gameplay.toJson(),
      auth: auth,
    );

    dynamic json = jsonDecode(convert(response.body));

    if (json is Map<String, dynamic>) {
      return GameplayModel.fromJson(json);
    }

    throw CustomException('Não foi possível gerar gameplay!');
  }

  Future<PlayerAddedModel> enterInGameplay(String code) async {
    Response response = await http.post('$path/jogar/$code', auth: auth);
    dynamic json = jsonDecode(convert(response.body));

    if (json is Map<String, dynamic>) {
      return PlayerAddedModel.fromJson(json);
    }

    throw CustomException('Não foi possível encontrar um jogo com este código!');
  }

  Future<GameplayResultModel> finishGameplay(String code, PlayerScoreModel playerScoreModel) async {
    Response response = await http.post(
      '$path/terminar/$code',
      body: playerScoreModel.toJson(),
      auth: auth,
    );
    dynamic json = jsonDecode(convert(response.body));

    if (json is Map<String, dynamic>) {
      return GameplayResultModel.fromJson(json);
    }

    throw CustomException('Não foi possível obter o resultado do jogo!');
  }

  Future<GameplayResultModel> getGameplayScores(String code) async {
    Response response = await http.get(
      '$path/pontuacoes/$code',
      auth: auth,
    );

    dynamic json = jsonDecode(convert(response.body));

    if (json is Map<String, dynamic>) {
      return GameplayResultModel.fromJson(json);
    }

    throw CustomException('Não foi possível obter o resultado do jogo!');
  }

  Future<CodesModel> getCodes() async {
    Response response = await http.get(
      '$path/codigos',
      auth: auth,
    );

    dynamic json = jsonDecode(convert(response.body));

    if (json is Map<String, dynamic>) {
      return CodesModel.fromJson(json);
    }

    throw CustomException('Não foi possível obter o resultado do jogo!');
  }
}
