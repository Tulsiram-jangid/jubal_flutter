import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/model/id_name_model.dart';

class CategoryServiceController {
  static Future<List<IdNameModel>> getUserService ({
    String search = ""
  })async {
    String URL = ApiUrl.userService;
    if(search.isNotEmpty){
      URL = "$URL?search=$search";
    }
    final res = await ApiRequest.request(url: URL, method: "GET");
    if(res.status){
      List<IdNameModel> list = [];
      list = IdNameModel.getFromJson(res.data, "service");
      return list;
    }
    return [];
  }
}