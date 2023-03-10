import 'package:json_annotation/json_annotation.dart';
import 'package:memory_game_web/src/dtos/card_score_dto.dart';

part 'player_score_dto.g.dart';

@JsonSerializable()
class PlayerScoreDto {
  final int score;

  @JsonKey(name: 'cardSet')
  final List<CardScoreDto> cardScoreDtoList;

  const PlayerScoreDto({
    required this.score,
    required this.cardScoreDtoList,
  });

  factory PlayerScoreDto.fromJson(Map<String, dynamic> json) => _$PlayerScoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerScoreDtoToJson(this);
}
