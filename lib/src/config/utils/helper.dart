import 'dart:convert';

class Helper {
  static String extractTokenContent(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token format');
    }
    final payload = parts[1];
    final normalizedPayload = base64Url.normalize(payload);
    final decodedPayload = utf8.decode(base64Url.decode(normalizedPayload));
    final payloadMap = json.decode(decodedPayload);
    return payloadMap['email'];
  }
}
