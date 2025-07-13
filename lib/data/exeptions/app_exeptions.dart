class AppExeptions implements Exception {
  final String? message;
  final String? prefix;
  AppExeptions([this.message, this.prefix]);

  @override
  String toString() {
    return "$message$prefix";
  }
}

class NoInternetException extends AppExeptions {
  NoInternetException([String? message])
      : super(message, "No Internet Connection");
}
