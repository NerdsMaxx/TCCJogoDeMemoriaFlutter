import 'package:json_annotation/json_annotation.dart';

part 'card_score_dto.g.dart';

@JsonSerializable()
class CardScoreDto {
  final int id;
  final bool winner;

  const CardScoreDto({
    required this.id,
    required this.winner,
  });

  factory CardScoreDto.fromJson(Map<String, dynamic> json) => _$CardScoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CardScoreDtoToJson(this);
}
