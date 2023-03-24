import 'package:json_annotation/json_annotation.dart';
import 'package:memory_game_web/src/models/card_score_model.dart';

part 'player_score_model.g.dart';

@JsonSerializable()
class PlayerScoreModel {
  final int score;

  // @JsonKey(name: 'cardSet')
  // final List<CardScoreModel> cardScoreList;

  const PlayerScoreModel({
    required this.score,
    //required this.cardScoreList,
  });

  factory PlayerScoreModel.fromJson(Map<String, dynamic> json) => _$PlayerScoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerScoreModelToJson(this);
}
