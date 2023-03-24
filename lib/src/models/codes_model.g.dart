// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodesModel _$CodesModelFromJson(Map<String, dynamic> json) => CodesModel(
      codes: (json['codes'] as List<dynamic>)
          .map((e) => MemoryGameModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CodesModelToJson(CodesModel instance) =>
    <String, dynamic>{
      'codes': instance.codes,
    };
