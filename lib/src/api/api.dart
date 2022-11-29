import 'dart:io' show HttpHeaders;

import 'package:http/http.dart' as http show Response, get;
import 'package:jogo_de_memoria_flutter/src/api/url_api.dart';

abstract class Api {
  static Future<http.Response> get(final String request) {
    return http.get(
      Uri.parse('${UrlApi.urlApi}/$request'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptLanguageHeader: 'pt-BR',
      },
    );
  }
}
