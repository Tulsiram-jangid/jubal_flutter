import 'package:my_app/api/ApiModel/LoginRequestModel.dart';
import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';

class AuthServiceController {
  static Future<dynamic> loginByEmail(
      {String email = "", String password = ""}) async {
    final body = {
      "email": email,
      "password": password,
      "deviceId": "121212",
      "deviceToken": "1212121221"
    };
    return await ApiRequest.request(
        url: ApiUrl.login, body: body, method: "POST");
  }
}
