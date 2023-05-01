import 'package:json_annotation/json_annotation.dart';

part 'previous_gameplays_player_model.g.dart';

@JsonSerializable()
class PreviousGameplaysPlayerModel {
  final String memoryGame;
  final String player;
  final String creator;
  final int score;
  final int numberRightOptions;
  final int numberWrongOptions;
  final int numberAttempts;
  final DateTime startTime;
  final DateTime endTime;

  const PreviousGameplaysPlayerModel({
    required this.memoryGame,
    required this.player,
    required this.creator,
    required this.score,
    required this.numberRightOptions,
    required this.numberWrongOptions,
    required this.numberAttempts,
    required this.startTime,
    required this.endTime,
  });

  factory PreviousGameplaysPlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PreviousGameplaysPlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PreviousGameplaysPlayerModelToJson(this);
}
