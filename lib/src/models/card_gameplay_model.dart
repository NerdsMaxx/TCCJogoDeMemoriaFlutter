import 'package:uuid/uuid.dart';

class CardGameplayModel {
  final id = const Uuid().v4();
  String content;
  CardGameplayModel? otherCard;
  bool isAccepted = false;
  bool isTurned = false;

  CardGameplayModel({required this.content, this.otherCard});

  void turnsCard() => isTurned = true;
  void turnCardOver() => isTurned = false;
  void changeTurned() => isTurned = !isTurned;

  void accept() => isAccepted = true;
}
