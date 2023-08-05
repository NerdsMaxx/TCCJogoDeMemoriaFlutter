// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_gameplays_creator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviousGameplaysCreatorModel _$PreviousGameplaysCreatorModelFromJson(
        Map<String, dynamic> json) =>
    PreviousGameplaysCreatorModel(
      gameplayId: json['gameplayId'] as int,
      memoryGame: json['memoryGame'] as String,
      usedCode: json['usedCode'] as String,
      numbersPlayer: json['numbersPlayer'] as int,
      startTime: DateTime.parse(json['startTime'] as String),
      lastTime: json['lastTime'] == null
          ? null
          : DateTime.parse(json['lastTime'] as String),
    );

Map<String, dynamic> _$PreviousGameplaysCreatorModelToJson(
        PreviousGameplaysCreatorModel instance) =>
    <String, dynamic>{
      'gameplayId': instance.gameplayId,
      'memoryGame': instance.memoryGame,
      'usedCode': instance.usedCode,
      'numbersPlayer': instance.numbersPlayer,
      'startTime': instance.startTime.toIso8601String(),
      'lastTime': instance.lastTime?.toIso8601String(),
    };
