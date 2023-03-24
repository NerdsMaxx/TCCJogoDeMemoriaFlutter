import 'package:json_annotation/json_annotation.dart';

part 'new_account_model.g.dart';

@JsonSerializable()
class NewAccountModel {
  final String name;
  final String username;
  final String email;
  final String password;
  final String type;

  const NewAccountModel({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.type,
  });

  Map<String, dynamic> toJson() => _$NewAccountModelToJson(this);
}
