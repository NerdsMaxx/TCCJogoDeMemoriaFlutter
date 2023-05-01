// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gameplay_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameplayResultModel _$GameplayResultModelFromJson(Map<String, dynamic> json) =>
    GameplayResultModel(
      memoryGame: json['memoryGame'] as String,
      creator: json['creator'] as String,
      playerResultList: (json['playerSet'] as List<dynamic>)
          .map((e) => PlayerResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      noPlayers: json['noPlayers'] as bool,
    );

Map<String, dynamic> _$GameplayResultModelToJson(
        GameplayResultModel instance) =>
    <String, dynamic>{
      'memoryGame': instance.memoryGame,
      'creator': instance.creator,
      'noPlayers': instance.noPlayers,
      'playerSet': instance.playerResultList,
    };
