// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_gameplays_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviousGameplaysModel _$PreviousGameplaysModelFromJson(
        Map<String, dynamic> json) =>
    PreviousGameplaysModel(
      memoryGame: json['memoryGame'] as String,
      creator: json['creator'] as String,
      score: json['score'] as int,
    );

Map<String, dynamic> _$PreviousGameplaysModelToJson(
        PreviousGameplaysModel instance) =>
    <String, dynamic>{
      'memoryGame': instance.memoryGame,
      'creator': instance.creator,
      'score': instance.score,
    };
