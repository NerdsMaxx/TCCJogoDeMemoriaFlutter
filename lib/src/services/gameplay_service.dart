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
import 'package:memory_game_web/src/models/previous_gameplays_creator_model.dart';
import 'package:memory_game_web/src/models/previous_gameplays_player_model.dart';
import 'package:memory_game_web/src/utils/json_util.dart';

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

    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is Map<String, dynamic>) {
      return GameplayModel.fromJson(json);
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<PlayerAddedModel> enterInGameplay(String code) async {
    Response response = await http.post('$path/jogar/$code', auth: auth);
    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is Map<String, dynamic>) {
      return PlayerAddedModel.fromJson(json);
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<GameplayResultModel> finishGameplay(String code, PlayerScoreModel playerScoreModel) async {
    Response response = await http.post(
      '$path/terminar/$code',
      body: playerScoreModel.toJson(),
      auth: auth,
    );

    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is Map<String, dynamic>) {
      return GameplayResultModel.fromJson(json);
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<GameplayResultModel> getGameplayScores(String code) async {
    Response response = await http.get(
      '$path/pontuacoes/$code',
      auth: auth,
    );

    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is Map<String, dynamic>) {
      return GameplayResultModel.fromJson(json);
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<CodesModel> getCodes() async {
    Response response = await http.get(
      '$path/codigos',
      auth: auth,
    );

    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is Map<String, dynamic>) {
      return CodesModel.fromJson(json);
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<List<PreviousGameplaysPlayerModel>> getPreviousGameplaysByPlayer() async {
    Response response = await http.get(
      '$path/partidas-anteriores/jogador',
      auth: auth,
    );

    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is List) {
      return json.map((e) => PreviousGameplaysPlayerModel.fromJson(e)).toList();
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<List<PreviousGameplaysCreatorModel>> getPreviousGameplaysByCreator() async {
    Response response = await http.get(
      '$path/partidas-anteriores/criador',
      auth: auth,
    );

    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is List) {
      return json.map((e) => PreviousGameplaysCreatorModel.fromJson(e)).toList();
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

    Future<List<PreviousGameplaysPlayerModel>> getScoresByGameplay(int gameplayId) async {
    Response response = await http.get(
      '$path/partidas-anteriores/criador/jogadores/$gameplayId',
      auth: auth,
    );

    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is List) {
      return json.map((e) => PreviousGameplaysPlayerModel.fromJson(e)).toList();
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }
}
