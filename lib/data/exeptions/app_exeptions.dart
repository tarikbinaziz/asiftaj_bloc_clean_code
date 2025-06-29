import 'package:freezed_annotation/freezed_annotation.dart';

class AppExeptions implements Exception {
  final String message;
  final String prefix;
  AppExeptions(this.message);
}
