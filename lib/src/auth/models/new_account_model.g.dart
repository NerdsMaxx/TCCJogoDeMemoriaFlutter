// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccountModel _$NewAccountModelFromJson(Map<String, dynamic> json) =>
    NewAccountModel(
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NewAccountModelToJson(NewAccountModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'types': instance.types,
    };
