import 'dart:convert';
import 'dart:io' show HttpHeaders;

import 'package:http/http.dart' show Response;
import 'package:http/http.dart' as http show get, post, put;
import 'package:injectable/injectable.dart';
import 'package:memory_game_web/src/interfaces/http_interface.dart';

import '../api/url_api.dart';
import '../auth/auth.dart';

@named
@Injectable(as: HttpInterface)
class HttpImpl implements HttpInterface {
  @override
  Future<Response> get(String request, {Auth? auth}) {
    return http.get(
      Uri.parse('$URL_API/$request'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'}..addEntries(
          (auth?.token != null) ? [MapEntry(HttpHeaders.authorizationHeader, auth!.token!)] : []),
    );
  }

  @override
  Future<Response> post(String request, {dynamic body, Auth? auth}) {
    return http.post(
      Uri.parse('$URL_API/$request'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'}..addEntries(
          (auth?.token != null) ? [MapEntry(HttpHeaders.authorizationHeader, auth!.token!)] : []),
      body: (body != null) ? jsonEncode(body) : null,
    );
  }

  @override
  Future<Response> put(String request, {dynamic body, Auth? auth}) {
    return http.put(
      Uri.parse('$URL_API/$request'),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'}..addEntries(
          (auth?.token != null) ? [MapEntry(HttpHeaders.authorizationHeader, auth!.token!)] : []),
      body: (body != null) ? jsonEncode(body) : null,
    );
  }
}
