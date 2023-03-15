import 'package:json_annotation/json_annotation.dart';

part 'gameplay_model.g.dart';

@JsonSerializable()
class GameplayModel {
  final String code;

  const GameplayModel({
    required this.code,
  });

  factory GameplayModel.fromJson(Map<String, dynamic> json) => _$GameplayModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameplayModelToJson(this);
}
