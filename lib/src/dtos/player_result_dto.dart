import 'package:json_annotation/json_annotation.dart';

part 'player_result_dto.g.dart';

@JsonSerializable()
class PlayerResultDto {
  final String player;
  final int score;
  final int numberPairCardCorrect;
  final int numberPairCardWrong;

  const PlayerResultDto({
    required this.player,
    required this.score,
    required this.numberPairCardCorrect,
    required this.numberPairCardWrong,
  });

  factory PlayerResultDto.fromJson(Map<String, dynamic> json) => _$PlayerResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerResultDtoToJson(this);
}
