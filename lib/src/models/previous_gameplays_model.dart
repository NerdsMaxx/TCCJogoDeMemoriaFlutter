import 'package:json_annotation/json_annotation.dart';

part 'previous_gameplays_model.g.dart';

@JsonSerializable()
class PreviousGameplaysModel {
  final String memoryGame;
  final String creator;
  final int score;

  const PreviousGameplaysModel({
    required this.memoryGame,
    required this.creator,
    required this.score,
  });

  factory PreviousGameplaysModel.fromJson(Map<String, dynamic> json) =>
      _$PreviousGameplaysModelFromJson(json);

  Map<String, dynamic> toJson() => _$PreviousGameplaysModelToJson(this);
}
