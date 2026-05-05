import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  ApiService({
    required this.baseUrl,
    http.Client? client,
    this.timeout = const Duration(seconds: 30),
  }) : _client = client ?? http.Client();

  final String baseUrl;
  final Duration timeout;
  final http.Client _client;

  Uri _buildUri(String endpoint, [Map<String, String>? queryParameters]) {
    return Uri.parse(
      '$baseUrl$endpoint',
    ).replace(queryParameters: queryParameters);
  }

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, String>? queryParameters,
  }) async {
    final response = await _client
        .get(_buildUri(endpoint, queryParameters), headers: headers)
        .timeout(timeout);

    return _parseResponse(response);
  }

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, String>? headers,
    Object? body,
    Map<String, String>? queryParameters,
  }) async {
    final response = await _client
        .post(
          _buildUri(endpoint, queryParameters),
          headers: {'Content-Type': 'application/json', ...?headers},
          body: body == null ? null : jsonEncode(body),
        )
        .timeout(timeout);

    return _parseResponse(response);
  }

  Map<String, dynamic> _parseResponse(http.Response response) {
    if (response.body.isEmpty) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {};
      }
      throw ApiException(response.statusCode, 'Request failed with empty body');
    }

    final decodedBody = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (decodedBody is Map<String, dynamic>) {
        return decodedBody;
      }
      return {'data': decodedBody};
    }

    final message = decodedBody is Map<String, dynamic>
        ? decodedBody['message']?.toString()
        : null;
    throw ApiException(
      response.statusCode,
      message ?? 'Request failed with status code ${response.statusCode}',
    );
  }

  void dispose() {
    _client.close();
  }
}

class ApiException implements Exception {
  ApiException(this.statusCode, this.message);

  final int statusCode;
  final String message;

  @override
  String toString() => 'ApiException($statusCode): $message';
}
