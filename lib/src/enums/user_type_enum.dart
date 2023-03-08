enum UserType {
  player('jogador'),
  creator('criador');

  final String type;

  const UserType(this.type);

  static UserType? getUserType(String? type) {
    if (type != null) {
      type = type.toUpperCase();

      if (type == 'CRIADOR') return creator;
      if (type == 'JOGADOR') return player;
    }

    return null;
  }
}
