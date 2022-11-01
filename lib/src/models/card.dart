class CardModel {
  CardModel({
    required this.id,
    this.otherId,
    this.phrase = '',
    this.isActive = true,
  });

  final int id;
  final int? otherId;
  String phrase;
  bool isActive;

  factory CardModel.from(CardModel card) => CardModel(
        id: card.id,
        otherId: card.otherId,
        phrase: card.phrase,
        isActive: card.isActive,
      );
}
