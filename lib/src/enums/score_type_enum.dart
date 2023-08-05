enum ScoreTypeEnum {
  onePlayerGameplay(1),
  currentGameplayByPlayer(2),
  currentGameplayByCreator(3),
  previousGameplayByPlayer(4),
  previousGameplayByCreator(5);

  final int id;

  const ScoreTypeEnum(this.id);

  static ScoreTypeEnum? of(final int id) {
    final Iterable<ScoreTypeEnum> scoreTypeIt = ScoreTypeEnum.values
        .where((scoreType) => scoreType.id == id);

    if(scoreTypeIt.isEmpty){
      return null;
    }

    return scoreTypeIt.first;
  }
}