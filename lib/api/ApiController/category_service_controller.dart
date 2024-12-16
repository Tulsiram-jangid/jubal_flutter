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

  static Future<List<IdNameModel>> getPrimaryCategory ({
    String search = ""
  })async {
    String URL = ApiUrl.primaryCategory;
    if(search.isNotEmpty){
      URL = "$URL?search=$search";
    }
    final res = await ApiRequest.request(url: URL, method: "GET");
    if(res.status){
      List<IdNameModel> list = [];
      list = IdNameModel.getFromJson(res.data, "catagory");
      return list;
    }
    return [];
  }

  static Future<List<IdNameModel>> getMusicGenre ({
    String search = ""
  })async {
    String URL = ApiUrl.musicGenre;
    if(search.isNotEmpty){
      URL = "$URL?search=$search";
    }
    final res = await ApiRequest.request(url: URL, method: "GET");
    if(res.status){
      List<IdNameModel> list = [];
      list = IdNameModel.getFromJson(res.data, "type");
      return list;
    }
    return [];
  }

  static Future<List<IdNameModel>> getInstrument ({
    String search = ""
  })async {
    String URL = ApiUrl.getInstrument;
    if(search.isNotEmpty){
      URL = "$URL?search=$search";
    }
    final res = await ApiRequest.request(url: URL, method: "GET");
    if(res.status){
      List<IdNameModel> list = [];
      list = IdNameModel.getFromJson(res.data['instruments'], "instrumentName");
      return list;
    }
    return [];
  }
}