import 'dart:convert';

class Helper {

  static bool isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static int getNumber(int? number, { int defaultValue = 0 }) {
    if (number == null) {
      return defaultValue;
    }
    return int.tryParse(number.toString()) ?? defaultValue;
  }

  static int convertNumber(String number, { int defaultValue = 0 }) {
    return int.tryParse(number) ?? defaultValue;
  }

  static String convertDateToString(DateTime? dateTime) {
    if (dateTime == null) return '';
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
  }

  static Map<String, dynamic> decodeBase64(String encoded) {
    final parts = encoded.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}