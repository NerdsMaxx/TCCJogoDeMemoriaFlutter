// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_game_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoryGameDto _$MemoryGameDtoFromJson(Map<String, dynamic> json) =>
    MemoryGameDto(
      name: json['name'] as String,
      creator: json['creator'] as String,
      subjectList: (json['subjectSet'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cardDtoList: (json['cardSet'] as List<dynamic>?)
          ?.map((e) => CardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MemoryGameDtoToJson(MemoryGameDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'creator': instance.creator,
      'subjectSet': instance.subjectList,
      'cardSet': instance.cardDtoList,
    };
