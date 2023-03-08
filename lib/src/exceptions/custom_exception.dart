class CustomException implements Exception {
  CustomException(this._message);

  final String _message;

  get message => _message;
}
