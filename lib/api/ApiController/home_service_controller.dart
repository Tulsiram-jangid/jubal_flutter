import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';

class HomeServiceController {
  static Future<ApiResponse> getHomeData({int pageNumber = 1}) async {
    String URL = "${ApiUrl.dashboard}?limit=5&pageNumber=${pageNumber}";
    ApiResponse res = await ApiRequest.request(url: URL, method: "GET");
    return res;
  }
}
