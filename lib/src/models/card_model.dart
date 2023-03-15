import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  final int? id;
  final String firstContent;
  final String secondContent;

  CardModel({
    this.id,
    required this.firstContent,
    required this.secondContent,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
