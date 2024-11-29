import 'dart:convert';

class LoginRequestModel {
  String message;
  int statusCode;
  Map<String, dynamic>? data;
  List<Map<String, dynamic>>? dataList;
  bool status;

  LoginRequestModel({
    required this.message,
    required this.statusCode,
    this.data,
    required this.status,
    this.dataList
  });
}