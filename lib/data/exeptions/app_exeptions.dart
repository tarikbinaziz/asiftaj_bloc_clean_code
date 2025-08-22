class AppException implements Exception {
  final String? message;
  final String? prefix;
  AppException([this.message, this.prefix]);

  @override
  String toString() {
    return "$message$prefix";
  }
}

/// Exception class representing a fetch data error during communication.
class FetchDataException extends AppException {
  /// Constructor for creating a [FetchDataException] instance.
  ///
  /// The [message] parameter represents the error message.
  FetchDataException([String? message]) : super(message, 'Error During Communication');
}

/// Exception class representing a bad request error.
class BadRequestException extends AppException {
  /// Constructor for creating a [BadRequestException] instance.
  ///
  /// The [message] parameter represents the error message.
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

/// Exception class representing an unauthorized request error.
class UnauthorisedException extends AppException {
  /// Constructor for creating an [UnauthorisedException] instance.
  ///
  /// The [message] parameter represents the error message.
  UnauthorisedException([String? message]) : super(message, 'Unauthorised request');
}

/// Exception class representing an invalid input error.
class InvalidInputException extends AppException {
  /// Constructor for creating an [InvalidInputException] instance.
  ///
  /// The [message] parameter represents the error message.
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

/// Exception class representing a no internet connection error.
class NoInternetException extends AppException {
  /// Constructor for creating a [NoInternetException] instance.
  ///
  /// The [message] parameter represents the error message.
  NoInternetException([String? message]) : super(message, 'No Internet Connection');
}
