// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerResultModel _$PlayerResultModelFromJson(Map<String, dynamic> json) =>
    PlayerResultModel(
      player: json['player'] as String,
      score: json['score'] as int,
    );

Map<String, dynamic> _$PlayerResultModelToJson(PlayerResultModel instance) =>
    <String, dynamic>{
      'player': instance.player,
      'score': instance.score,
    };
