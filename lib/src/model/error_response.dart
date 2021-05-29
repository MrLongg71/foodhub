import 'package:dio/dio.dart';

class ErrorResponse {
  int? statusCode;
  String? message;

  ErrorResponse.fromJson(Map<String, dynamic>? json) {
    statusCode = json!['code'];
    message = json['message'];
  }

  ErrorResponse({this.statusCode, this.message});

  String toString() {
    return message ?? "";
  }
}
