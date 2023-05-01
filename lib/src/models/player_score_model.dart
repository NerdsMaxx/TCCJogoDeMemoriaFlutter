import 'package:json_annotation/json_annotation.dart';

part 'player_score_model.g.dart';

@JsonSerializable()
class PlayerScoreModel {
  final int score;
  final int numberRightOptions;
  final int numberWrongOptions;
  final int numberAttempts;
  
  const PlayerScoreModel({
    required this.score,
    required this.numberRightOptions,
    required this.numberWrongOptions,
    required this.numberAttempts,
  });

  factory PlayerScoreModel.fromJson(Map<String, dynamic> json) => _$PlayerScoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerScoreModelToJson(this);
}
