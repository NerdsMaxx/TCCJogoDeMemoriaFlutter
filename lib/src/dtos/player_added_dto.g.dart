// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_added_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerAddedDto _$PlayerAddedDtoFromJson(Map<String, dynamic> json) =>
    PlayerAddedDto(
      player: json['player'] as String,
      memoryGame:
          MemoryGameDto.fromJson(json['memoryGame'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlayerAddedDtoToJson(PlayerAddedDto instance) =>
    <String, dynamic>{
      'player': instance.player,
      'memoryGame': instance.memoryGame,
    };
