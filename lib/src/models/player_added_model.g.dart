// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_added_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerAddedModel _$PlayerAddedModelFromJson(Map<String, dynamic> json) =>
    PlayerAddedModel(
      player: json['player'] as String,
      memoryGame:
          MemoryGameModel.fromJson(json['memoryGame'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerAddedModelToJson(PlayerAddedModel instance) =>
    <String, dynamic>{
      'player': instance.player,
      'memoryGame': instance.memoryGame,
    };
