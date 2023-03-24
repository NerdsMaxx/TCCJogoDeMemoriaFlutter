import 'package:json_annotation/json_annotation.dart';

part 'gameplay_model.g.dart';

@JsonSerializable()
class GameplayModel {
  final String? memoryGame;
  final String? creator;
  final bool? alone;
  final String? code;

  const GameplayModel({
    this.memoryGame,
    this.creator,
    this.alone,
    this.code,
  });

  factory GameplayModel.fromJson(Map<String, dynamic> json) => _$GameplayModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameplayModelToJson(this);
}
