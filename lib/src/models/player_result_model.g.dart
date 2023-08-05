// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerResultModel _$PlayerResultModelFromJson(Map<String, dynamic> json) =>
    PlayerResultModel(
      player: json['player'] as String,
      creator: json['creator'] as String,
      score: json['score'] as int,
      numberRightOptions: json['numberRightOptions'] as int,
      numberWrongOptions: json['numberWrongOptions'] as int,
      numberAttempts: json['numberAttempts'] as int,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$PlayerResultModelToJson(PlayerResultModel instance) =>
    <String, dynamic>{
      'player': instance.player,
      'creator': instance.creator,
      'score': instance.score,
      'numberRightOptions': instance.numberRightOptions,
      'numberWrongOptions': instance.numberWrongOptions,
      'numberAttempts': instance.numberAttempts,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
    };
