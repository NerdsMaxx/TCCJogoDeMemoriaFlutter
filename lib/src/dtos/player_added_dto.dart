import 'package:memory_game_web/src/dtos/memory_game_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_added_dto.g.dart';

@JsonSerializable()
class PlayerAddedDto {
  final String player;
  final MemoryGameDto memoryGame;

  const PlayerAddedDto({
    required this.player,
    required this.memoryGame,
  });

  factory PlayerAddedDto.fromJson(Map<String, dynamic> json) => _$PlayerAddedDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerAddedDtoToJson(this);
}
