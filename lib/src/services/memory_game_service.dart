import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/src/abstract_classes/service_abs.dart';
import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:memory_game_web/src/exceptions/custom_exception.dart';

import '../api/api.dart';

@injectable
class MemoryGameService extends Service {
  const MemoryGameService(super.auth, @Named.from(Api) super.api);

  Future<List<MemoryGameDto>> getAllMemoryGame() async {
    Response response = await api.get('jogo-de-memoria', auth: auth);
    dynamic json = jsonDecode(response.body);
    json = json['content'];

    if (json is List) {
      return json.map((memoryGame) => MemoryGameDto.fromJson(memoryGame)).toList();
    }

    throw CustomException('Não foi possível obter os jogos de memória.');
  }

  Future<MemoryGameDto> getMemoryGame(String name) async {
    Response response = await api.get('jogo-de-memoria/$name', auth: auth);
    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      return MemoryGameDto.fromJson(json);
    }

    throw Exception('Não foi possível obter o jogo de memória.');
  }

  Future<MemoryGameDto> update(String name, MemoryGameDto dto) async {
    Response response = await api.put('jogo-de-memoria/$name', dto.toJson(), auth: auth);
    dynamic json = jsonDecode(response.body);

    if (json is Map<String, dynamic>) {
      return MemoryGameDto.fromJson(json);
    }

    throw Exception('Não foi possível atualizar o jogo de memória.');
  }
}
