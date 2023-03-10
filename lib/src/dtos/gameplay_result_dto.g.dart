// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gameplay_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameplayResultDto _$GameplayResultDtoFromJson(Map<String, dynamic> json) =>
    GameplayResultDto(
      memoryGame: json['memoryGame'] as String,
      creator: json['creator'] as String,
      playerResultList: (json['playerSet'] as List<dynamic>)
          .map((e) => PlayerResultDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      allFinished: json['allFinished'] as bool,
    );

Map<String, dynamic> _$GameplayResultDtoToJson(GameplayResultDto instance) =>
    <String, dynamic>{
      'memoryGame': instance.memoryGame,
      'creator': instance.creator,
      'allFinished': instance.allFinished,
      'playerSet': instance.playerResultList,
    };
