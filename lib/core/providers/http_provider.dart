import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qola_app/core/exceptions/exception.dart';
import 'package:qola_app/core/utils/console.dart';

class HttpProvider {

  Future<dynamic> get(String apiUrl, { String? token, bool isBearer = true}) async {
    Console.printInfo('[GET] $apiUrl');
    try {
      Map<String, String> headers = { 'Content-Type': 'application/json', 'Accept': 'application/json' };
      if (token != null) {
        final prefix = isBearer ? 'Bearer ' : '';
        headers['Authorization'] = '$prefix$token';
      }
      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('NO_INTERNET_CONNECTION');
    }
  }

  Future<dynamic> post(String apiUrl, String body, { String? token, bool isBearer = true}) async {
    Console.printInfo('[POST] $apiUrl');
    Console.printInfo('[POST] $body');
    try {
      Map<String, String> headers = { 'Content-Type': 'application/json', 'Accept': 'application/json' };
      if (token != null) {
        final prefix = isBearer ? 'Bearer ' : '';
        headers['Authorization'] = '$prefix$token';
      }
      final response = await http.post(Uri.parse(apiUrl), body: body, headers: headers).timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            return http.Response('Error', 408);
          }
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('NO_INTERNET_CONNECTION');
    }
  }

  Future<dynamic> put(String apiUrl, String body, { String? token, bool isBearer = true}) async {
    Console.printInfo('[PUT] $apiUrl');
    Console.printInfo('[PUT] $body');
    try {
      Map<String, String> headers = { 'Content-Type': 'application/json', 'Accept': 'application/json' };
      if (token != null) {
        final prefix = isBearer ? 'Bearer ' : '';
        headers['Authorization'] = '$prefix$token';
      }
      final response = await http.put(Uri.parse(apiUrl), body: body, headers: headers).timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            return http.Response('Error', 408);
          }
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('NO_INTERNET_CONNECTION');
    }
  }

  Future<dynamic> delete(String apiUrl, { String? token, bool isBearer = true}) async {
    Console.printInfo('[DELETE] $apiUrl');
    try {
      Map<String, String> headers = { 'Content-Type': 'application/json', 'Accept': 'application/json' };
      if (token != null) {
        final prefix = isBearer ? 'Bearer ' : '';
        headers['Authorization'] = '$prefix$token';
      }
      final response = await http.delete(Uri.parse(apiUrl), headers: headers);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException('NO_INTERNET_CONNECTION');
    }
  }

  Future<dynamic> postMultipart(String apiUrl, { Map<String, String>? fields,
    required List<http.MultipartFile>? files, bool authenticated = false, String? token, bool isBearer = true
  }) async {
    Console.printInfo('[POST] $apiUrl');
    Console.printInfo('[POST] $fields');
    try {
      Map<String, String> headers = { 'Accept': 'application/json' };
      if (token != null) {
        final prefix = isBearer ? 'Bearer ' : '';
        headers['Authorization'] = '$prefix$token';
      }

      final request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.headers.addAll(headers);
      request.files.addAll(files ?? []);
      if (fields != null) request.fields.addAll(fields);

      var response = await request.send();

      return await _returnMultipartResponse(response);
    }
    on SocketException {
      throw FetchDataException('NO_INTERNET_CONNECTION');
    }
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      //var responseJson = json.decode(response.body);
      Console.printSuccess('[RESPONSE] ${response.body}');
      var responseJson = json.decode(const Utf8Decoder().convert(response.bodyBytes));
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorizedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

dynamic _returnMultipartResponse(http.StreamedResponse response) async {
  switch (response.statusCode) {
    case 200:
      return await _responseJsonMultipart(response);
    case 400:
      throw BadRequestException(response);
    case 401:
    case 403:
      throw UnauthorizedException(response);
    case 500:
    default:
      throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

dynamic _responseJsonMultipart(http.StreamedResponse response) async{
  Completer<String> completer = Completer<String>();

  response.stream.transform(utf8.decoder).listen((value) {
    Console.printSuccess('[RESPONSE] $value');
    completer.complete(value);
  });

  var responseJson = json.decode((await completer.future));
  return responseJson;
}
