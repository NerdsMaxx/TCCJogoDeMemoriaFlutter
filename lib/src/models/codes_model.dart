import 'package:json_annotation/json_annotation.dart';
import 'package:memory_game_web/src/models/memory_game_model.dart';

part 'codes_model.g.dart';

@JsonSerializable()
class CodesModel {
  final List<MemoryGameModel> codes;

  const CodesModel({
    required this.codes,
  });

  factory CodesModel.fromJson(Map<String, dynamic> json) => _$CodesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CodesModelToJson(this);
}
