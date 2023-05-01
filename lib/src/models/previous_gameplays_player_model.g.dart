// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_gameplays_player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviousGameplaysPlayerModel _$PreviousGameplaysPlayerModelFromJson(
        Map<String, dynamic> json) =>
    PreviousGameplaysPlayerModel(
      memoryGame: json['memoryGame'] as String,
      player: json['player'] as String,
      creator: json['creator'] as String,
      score: json['score'] as int,
      numberRightOptions: json['numberRightOptions'] as int,
      numberWrongOptions: json['numberWrongOptions'] as int,
      numberAttempts: json['numberAttempts'] as int,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
    );

Map<String, dynamic> _$PreviousGameplaysPlayerModelToJson(
        PreviousGameplaysPlayerModel instance) =>
    <String, dynamic>{
      'memoryGame': instance.memoryGame,
      'player': instance.player,
      'creator': instance.creator,
      'score': instance.score,
      'numberRightOptions': instance.numberRightOptions,
      'numberWrongOptions': instance.numberWrongOptions,
      'numberAttempts': instance.numberAttempts,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
    };
