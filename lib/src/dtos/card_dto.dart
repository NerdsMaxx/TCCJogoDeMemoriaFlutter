import 'package:json_annotation/json_annotation.dart';

part 'card_dto.g.dart';

@JsonSerializable()
class CardDto {
  final int id;
  final String firstContent;
  final String secondContent;

  CardDto({
    required this.id,
    required this.firstContent,
    required this.secondContent,
  });

  factory CardDto.fromJson(Map<String, dynamic> json) => _$CardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CardDtoToJson(this);
}
