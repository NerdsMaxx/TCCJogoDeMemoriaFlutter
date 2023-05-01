
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/src/abstract_classes/service_abs.dart';
import 'package:memory_game_web/src/api/http_impl.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';
import 'package:memory_game_web/src/utils/json_util.dart';

@injectable
class MemoryGameService extends Service {
  const MemoryGameService(super.auth, @Named.from(HttpImpl) super.http);

  static const String path = 'jogo-de-memoria';

  Future<List<MemoryGameModel>> getAllMemoryGame([bool isCreator = false]) async {
    Response response;

    if (isCreator) {
      response = await http.get(
        '$path/criador',
        auth: auth,
      );
    } else {
      response = await http.get(
        '$path/jogador',
        auth: auth,
      );
    }

    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is List) {
      return json.map((memoryGame) => MemoryGameModel.fromJson(memoryGame)).toList();
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<List<MemoryGameModel>> getAllMemoryGameBySearch(String search,
      [bool isCreator = false]) async {
    Response response;

    if (isCreator) {
      response = await http.get(
        '$path/pesquisar/criador/$search',
        auth: auth,
      );
    } else {
      response = await http.get(
        '$path/pesquisar/jogador/$search',
        auth: auth,
      );
    }

    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is List) {
      return json.map((memoryGame) => MemoryGameModel.fromJson(memoryGame)).toList();
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<MemoryGameModel> getMemoryGame(String name, [String? creatorUsername]) async {
    String request = '';
    if (creatorUsername != null) {
      request = '$path/$name/$creatorUsername';
    } else {
      request = '$path/$name';
    }

    Response response = await http.get(request, auth: auth);
    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is Map<String, dynamic>) {
      return MemoryGameModel.fromJson(json);
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<MemoryGameModel> saveMemoryGame(MemoryGameModel memoryGame) async {
    Response response = await http.post(path, body: memoryGame.toJson(), auth: auth);
    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is Map<String, dynamic>) {
      return MemoryGameModel.fromJson(json);
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }

  Future<MemoryGameModel> updateMemoryGame(String name, MemoryGameModel memoryGame) async {
    Response response = await http.put('$path/$name', body: memoryGame.toJson(), auth: auth);
    dynamic json = JsonUtil.tryToDecodeJson(response.body);

    if (json is Map<String, dynamic>) {
      return MemoryGameModel.fromJson(json);
    } else if (json is String) {
      throw CustomException(json);
    }

    throw CustomException.anyError();
  }
}
