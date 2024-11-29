import 'package:flutter/material.dart';
import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/helper/helper.dart';

class AuthServiceController {
  static Future<ApiResponse> loginByEmail(
      {String email = "", String password = "", BuildContext? context}) async {
    final body = {
      "email": email,
      "password": password,
      "deviceId": "121212",
      "deviceToken": "1212121221"
    };
    ApiResponse res =
        await ApiRequest.request(url: ApiUrl.login, body: body, method: "POST");
    if (context!.mounted && ApiRequest.isSuccess(res.toJosn(), context)) {
      return res;
    }
    return res;
  }
}
