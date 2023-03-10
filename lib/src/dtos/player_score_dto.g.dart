// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_score_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerScoreDto _$PlayerScoreDtoFromJson(Map<String, dynamic> json) =>
    PlayerScoreDto(
      score: json['score'] as int,
      cardScoreDtoList: (json['cardSet'] as List<dynamic>)
          .map((e) => CardScoreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlayerScoreDtoToJson(PlayerScoreDto instance) =>
    <String, dynamic>{
      'score': instance.score,
      'cardSet': instance.cardScoreDtoList,
    };
