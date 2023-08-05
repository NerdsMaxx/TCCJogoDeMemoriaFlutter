import 'package:json_annotation/json_annotation.dart';

part 'previous_gameplays_creator_model.g.dart';

@JsonSerializable()
class PreviousGameplaysCreatorModel {
  final int gameplayId;
  final String memoryGame;
  final String usedCode;
  final int numbersPlayer;
  final DateTime startTime;
  final DateTime? lastTime;

  const PreviousGameplaysCreatorModel({
    required this.gameplayId,
    required this.memoryGame,
    required this.usedCode,
    required this.numbersPlayer,
    required this.startTime,
    this.lastTime,
  });

  factory PreviousGameplaysCreatorModel.fromJson(Map<String, dynamic> json) =>
      _$PreviousGameplaysCreatorModelFromJson(json);

  Map<String, dynamic> toJson() => _$PreviousGameplaysCreatorModelToJson(this);
}