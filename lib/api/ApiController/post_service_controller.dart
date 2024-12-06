import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/constant/app_constant.dart';

class PostServiceController {
  static Future<ApiResponse> getPostLikes({
    int? page = 1,
  }) async {
    String URL = ApiUrl.getPostLikes;
    URL = "${URL}?limit=${AppConstant.pageLimit}&pageNumber=${page}";

    return await ApiRequest.request(url: URL, method: "GET");
    //return
  }
}
