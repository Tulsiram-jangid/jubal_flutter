import 'package:flutter/material.dart';
import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/constant/app_constant.dart';

class EventServiceController {
  static Future<ApiResponse> getEventList(
      {BuildContext? context, int page = 1, String? eventName = ""}) async {
    final URL = ApiUrl.eventList;

    late final body;

    if (eventName != null && eventName.isNotEmpty) {
      body = {
        "limit": AppConstant.pageLimit,
        "pageNumber": page,
        "where":{
          "eventName": eventName
        }
      };
    } else {
      body = {
        "limit": AppConstant.pageLimit,
        "pageNumber": page,
      };
    }

    ApiResponse res =
        await ApiRequest.request(url: URL, method: "POST", body: body);
    return res;
  }
}
