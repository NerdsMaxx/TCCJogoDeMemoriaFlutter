import 'dart:convert';

class JsonUtil {
  _JsonUtil() {}

  static String _fixJson(String body) => const Utf8Decoder().convert(body.codeUnits);

  static dynamic tryToDecodeJson(String json) {
    try {
      json = _fixJson(json);
      return jsonDecode(json);
    } catch (_) {
      return json;
    }
  }
}
