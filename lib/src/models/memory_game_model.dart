import 'package:json_annotation/json_annotation.dart';
import 'package:memory_game_web/src/models/card_model.dart';

part 'memory_game_model.g.dart';

@JsonSerializable()
class MemoryGameModel {
  final String name;
  final String creator;

  @JsonKey(name: 'subjectSet')
  final List<String> subjectList;

  @JsonKey(name: 'cardSet')
  final List<CardModel>? cardList;

  const MemoryGameModel({
    required this.name,
    required this.creator,
    required this.subjectList,
    this.cardList,
  });

  factory MemoryGameModel.fromJson(Map<String, dynamic> json) => _$MemoryGameModelFromJson(json);

  Map<String, dynamic> toJson() => _$MemoryGameModelToJson(this);
}
