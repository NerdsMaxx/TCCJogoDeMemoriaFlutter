// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gameplay_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameplayModel _$GameplayModelFromJson(Map<String, dynamic> json) =>
    GameplayModel(
      memoryGame: json['memoryGame'] as String?,
      creator: json['creator'] as String?,
      alone: json['alone'] as bool?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$GameplayModelToJson(GameplayModel instance) =>
    <String, dynamic>{
      'memoryGame': instance.memoryGame,
      'creator': instance.creator,
      'alone': instance.alone,
      'code': instance.code,
    };
