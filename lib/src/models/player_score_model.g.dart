// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerScoreModel _$PlayerScoreModelFromJson(Map<String, dynamic> json) =>
    PlayerScoreModel(
      score: json['score'] as int,
      cardScoreList: (json['cardSet'] as List<dynamic>)
          .map((e) => CardScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerScoreModelToJson(PlayerScoreModel instance) =>
    <String, dynamic>{
      'score': instance.score,
      'cardSet': instance.cardScoreList,
    };
