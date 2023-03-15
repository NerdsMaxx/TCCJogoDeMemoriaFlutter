import 'package:json_annotation/json_annotation.dart';
import 'package:memory_game_web/src/models/player_result_model.dart';

part 'gameplay_result_model.g.dart';

@JsonSerializable()
class GameplayResultModel {
  final String memoryGame;
  final String creator;
  final bool allFinished;

  @JsonKey(name: 'playerSet')
  final List<PlayerResultModel> playerResultList;

  const GameplayResultModel({
    required this.memoryGame,
    required this.creator,
    required this.playerResultList,
    required this.allFinished,
  });

  factory GameplayResultModel.fromJson(Map<String, dynamic> json) =>
      _$GameplayResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameplayResultModelToJson(this);
}
