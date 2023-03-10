import 'package:json_annotation/json_annotation.dart';

part 'gameplay_dto.g.dart';

@JsonSerializable()
class GameplayDto {
  final String code;

  const GameplayDto({
    required this.code,
  });

  factory GameplayDto.fromJson(Map<String, dynamic> json) => _$GameplayDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GameplayDtoToJson(this);
}
