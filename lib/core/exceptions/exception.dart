class ApiException implements Exception {
  final String? _message;
  final String? _prefix;

  ApiException([this._message, this._prefix]);

  @override
  String toString() => "[$_prefix] $_message";
}

class FetchDataException extends ApiException {
  FetchDataException([message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([message]) : super(message, "Unauthorized: ");
}

class InvalidInputException extends ApiException {
  InvalidInputException([message]) : super(message, "Invalid Input: ");
}