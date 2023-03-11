import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/src/abstract_classes/service_abs.dart';
import 'package:memory_game_web/src/api/http_impl.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';

@injectable
class MemoryGameService extends Service {
  const MemoryGameService(super.auth, @Named.from(HttpImpl) super.http);

  static const String path = 'jogo-de-memoria';

  Future<List<MemoryGameDto>> getAllMemoryGame() async {
    Response response = await http.get(path, auth: auth);
    dynamic json = jsonDecode(response.body);
    json = json['content'];

    if (json is List) {
      return json.map((memoryGame) => MemoryGameDto.fromJson(memoryGame)).toList();
    }

    throw CustomException('Não foi possível obter os jogos de memória.');
  }

  Future<MemoryGameDto> getMemoryGame(String name, [String? creatorUsername]) async {
    String request = '';
    if (creatorUsername != null) {
      request = '$path/$name/$creatorUsername';
    } else {
      request = '$path/$name';
    }

    Response response = await http.get(request, auth: auth);
    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      return MemoryGameDto.fromJson(json);
    }

    throw CustomException('Não foi possível obter o jogo de memória.');
  }

  Future<MemoryGameDto> saveMemoryGame(MemoryGameDto memoryGameDto) async {
    if(auth.isNotCreator()) {
      throw CustomException('Não é autorizado!');
    }

    Response response = await http.post( path, body: memoryGameDto.toJson(), auth: auth);
    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      return MemoryGameDto.fromJson(json);
    }

    throw CustomException('Não foi possível salvar o jogo de memória.');

  }

  Future<MemoryGameDto> updateMemoryGame(String name, MemoryGameDto memoryGameDto) async {
    if(auth.isNotCreator()) {
      throw CustomException('Não é autorizado!');
    }

    Response response = await http.put('$path/$name', body: memoryGameDto.toJson(), auth: auth);
    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      return MemoryGameDto.fromJson(json);
    }

    throw CustomException('Não foi possível atualizar o jogo de memória.');
  }
}
