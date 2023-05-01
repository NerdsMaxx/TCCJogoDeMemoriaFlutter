import 'package:json_annotation/json_annotation.dart';

part 'player_result_model.g.dart';

@JsonSerializable()
class PlayerResultModel {
  final String player;
  final int score;
  final int numberRightOptions;
  final int numberWrongOptions;
  final int numberAttempts;

  const PlayerResultModel({
    required this.player,
    required this.score,
    required this.numberRightOptions,
    required this.numberWrongOptions,
    required this.numberAttempts,
  });

  factory PlayerResultModel.fromJson(Map<String, dynamic> json) => _$PlayerResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerResultModelToJson(this);
}
