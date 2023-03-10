import 'package:json_annotation/json_annotation.dart';
import 'package:memory_game_web/src/dtos/player_result_dto.dart';

part 'gameplay_result_dto.g.dart';

@JsonSerializable()
class GameplayResultDto {
  final String memoryGame;
  final String creator;
  final bool allFinished;

  @JsonKey(name: 'playerSet')
  final List<PlayerResultDto> playerResultList;

  const GameplayResultDto({
    required this.memoryGame,
    required this.creator,
    required this.playerResultList,
    required this.allFinished,
  });

  factory GameplayResultDto.fromJson(Map<String, dynamic> json) =>
      _$GameplayResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GameplayResultDtoToJson(this);
}
