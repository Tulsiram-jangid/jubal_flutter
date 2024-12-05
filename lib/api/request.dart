import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/helper/helper.dart';

class ApiResponse {
  bool status;
  String message;
  int? statusCode;
  dynamic data;

  ApiResponse({required this.status, required this.message, this.data, this.statusCode});

  Map<String, dynamic> toJosn() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class ApiRequest {
  // A common function to handle all HTTP requests

  static bool isSuccess(Map<String, dynamic> res, BuildContext? context) {
    if (res['status'] == false) {
      if (context != null && res['message'] != null) {
        Helper.showAlert(context, "Service Error", res['message']);
      }
      return false;
    }
    return true;
  }

  static Future<ApiResponse> request({
    required String url,
    String method = 'GET', // Default to 'GET' method
    Map<String, String>? headers,
    dynamic body,
  }) async {
    late ApiResponse apiRes;
    try {
      // Default headers for the request
      final requestHeaders = headers ?? {
        'Content-Type': "application/json",
        'Authorization': "Bearer ${AppConstant.userToken}"
        };
      final requestUrl = Uri.parse(url);

      http.Response res;

      // Handle different HTTP methods
      switch (method.toUpperCase()) {
        case 'POST':
          res = await http.post(requestUrl,
              headers: requestHeaders, body: jsonEncode(body));
          break;
        case 'PUT':
          res = await http.put(requestUrl,
              headers: requestHeaders, body: jsonEncode(body));
          break;
        case 'DELETE':
          res = await http.delete(requestUrl, headers: requestHeaders);
          break;
        case 'GET':
        default:
          res = await http.get(requestUrl, headers: requestHeaders);
          break;
      }

      // Check response status and return the data if successful
      Map<String, dynamic> jsonData = jsonDecode(res.body);
      if (jsonData.containsKey('status')) {
        apiRes = ApiResponse(
            status: jsonData['status'],
            message: jsonData['message'],
            data: jsonData['data']);
        return apiRes;
      }
      return ApiResponse(
          status: false, message: "Service error", data: jsonData);
    } catch (e) {
      print("Error: ${e.toString()}");
      return ApiResponse(status: false, message: "Service error", data: "");
    }
  }
}
