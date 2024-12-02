import 'package:flutter/material.dart';
import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';

class TalentServiceController {
  static Future<ApiResponse> getTalentList(
      {int page = 1,
      bool topFollower = false,
      bool topRated = false,
      BuildContext? context}) async {
    final URL = ApiUrl.filterTalent;
    final body = {
      "limit": 10,
      "page": page,
      "topFollower": topFollower,
      "topRated": topRated
    };

    ApiResponse res =
        await ApiRequest.request(url: URL, body: body, method: "POST");
    if (ApiRequest.isSuccess(res.toJosn(), context)) {}
    return res;
  }
}
