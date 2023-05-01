// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerScoreModel _$PlayerScoreModelFromJson(Map<String, dynamic> json) =>
    PlayerScoreModel(
      score: json['score'] as int,
      numberRightOptions: json['numberRightOptions'] as int,
      numberWrongOptions: json['numberWrongOptions'] as int,
      numberAttempts: json['numberAttempts'] as int,
    );

Map<String, dynamic> _$PlayerScoreModelToJson(PlayerScoreModel instance) =>
    <String, dynamic>{
      'score': instance.score,
      'numberRightOptions': instance.numberRightOptions,
      'numberWrongOptions': instance.numberWrongOptions,
      'numberAttempts': instance.numberAttempts,
    };
