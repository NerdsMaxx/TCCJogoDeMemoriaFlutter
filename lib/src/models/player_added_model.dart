import 'package:memory_game_web/src/models/memory_game_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_added_model.g.dart';

@JsonSerializable()
class PlayerAddedModel {
  final String player;
  final MemoryGameModel memoryGame;

  const PlayerAddedModel({
    required this.player,
    required this.memoryGame,
  });

  factory PlayerAddedModel.fromJson(Map<String, dynamic> json) => _$PlayerAddedModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerAddedModelToJson(this);
}
