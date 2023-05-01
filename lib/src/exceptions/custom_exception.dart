class CustomException implements Exception {
  CustomException(this._message);

  final String _message;

  get message => _message;

  @override
  String toString() => _message;

  factory CustomException.anyError() =>
      CustomException('Deu algo errado! Favor contatar com administrador!');
}
