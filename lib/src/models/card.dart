class CardModel {
  CardModel({
    required this.id,
    this.phrase,
    this.isActive = true,
  });

  final int id;
  String? phrase;
  bool isActive;

  factory CardModel.from(CardModel card) => CardModel(
        id: card.id,
        phrase: card.phrase,
        isActive: card.isActive,
      );
}
