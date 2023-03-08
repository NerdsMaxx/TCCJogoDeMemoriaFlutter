// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDto _$CardDtoFromJson(Map<String, dynamic> json) => CardDto(
      id: json['id'] as int,
      firstContent: json['firstContent'] as String,
      secondContent: json['secondContent'] as String,
    );

Map<String, dynamic> _$CardDtoToJson(CardDto instance) => <String, dynamic>{
      'id': instance.id,
      'firstContent': instance.firstContent,
      'secondContent': instance.secondContent,
    };
