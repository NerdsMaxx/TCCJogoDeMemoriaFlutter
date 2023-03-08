import 'package:memory_game_web/src/dtos/card_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'memory_game_dto.g.dart';

@JsonSerializable()
class MemoryGameDto {
  final String name;
  final String creator;

  @JsonKey(name: 'subjectSet')
  final List<String> subjectList;

  @JsonKey(name: 'cardSet')
  final List<CardDto>? cardDtoList;

  MemoryGameDto({
    required this.name,
    required this.creator,
    required this.subjectList,
    this.cardDtoList,
  });

  factory MemoryGameDto.fromJson(Map<String, dynamic> json) => _$MemoryGameDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MemoryGameDtoToJson(this);
}
