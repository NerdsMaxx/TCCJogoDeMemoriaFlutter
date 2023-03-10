// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerResultDto _$PlayerResultDtoFromJson(Map<String, dynamic> json) =>
    PlayerResultDto(
      player: json['player'] as String,
      score: json['score'] as int,
      numberPairCardCorrect: json['numberPairCardCorrect'] as int,
      numberPairCardWrong: json['numberPairCardWrong'] as int,
    );

Map<String, dynamic> _$PlayerResultDtoToJson(PlayerResultDto instance) =>
    <String, dynamic>{
      'player': instance.player,
      'score': instance.score,
      'numberPairCardCorrect': instance.numberPairCardCorrect,
      'numberPairCardWrong': instance.numberPairCardWrong,
    };
