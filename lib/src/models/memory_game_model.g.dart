// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemoryGameModel _$MemoryGameModelFromJson(Map<String, dynamic> json) =>
    MemoryGameModel(
      name: json['name'] as String,
      creator: json['creator'] as String,
      subjectList: (json['subjectSet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cardList: (json['cardSet'] as List<dynamic>?)
          ?.map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$MemoryGameModelToJson(MemoryGameModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'creator': instance.creator,
      'code': instance.code,
      'subjectSet': instance.subjectList,
      'cardSet': instance.cardList,
    };
