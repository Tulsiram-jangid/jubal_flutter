import 'package:flutter/material.dart';
import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/user_model.dart';
import 'package:my_app/store/SharedPrefrenceStorage.dart';
import 'package:my_app/store/StoreProvider.dart';
import 'package:provider/provider.dart';

class AuthServiceController {
  //This method sets the basic user login details
  static setUserLoginDetails(ApiResponse res, BuildContext context) async {
    await setUserToSharedPreference(res.data);
    if (res.data.containsKey("accessToken")) {
      AppConstant.setUserToken(res.data['accessToken']);
    }
    if (res.data.containsKey("id")) {
      AppConstant.setUserId(res.data['id']);
    }
    UserModel user = UserModel.getUserFromLoginApi(res.data);
    Provider.of<StoreProvider>(context, listen: false).setUser(user);
    Provider.of<StoreProvider>(context, listen: false).goToHome();
  }

  //This method set the user basic details when app start and user details found in shared preference
  static void setUserLoginFromSharedPreference(BuildContext context) async {
    final obj = await getUserFromSharedPreference();
    if (obj != null) {
      //if user logged in the set the user basic details
      if (obj.containsKey("accessToken")) {
        AppConstant.setUserToken(obj['accessToken']);
      }
      if (obj.containsKey("id")) {
        AppConstant.setUserId(obj['id']);
      }
      UserModel user = UserModel.getUserFromLoginApi(obj);
      Provider.of<StoreProvider>(context, listen: false).setUser(user);
      Provider.of<StoreProvider>(context, listen: false).goToHome();
      return;
    }
    //if user not login
    Provider.of<StoreProvider>(context, listen: false).goToLogin();
  }

  static void logoutUserFromApp(BuildContext context)async{
    await removeUserFromSharedPreference();
    Provider.of<StoreProvider>(context, listen: false).goToLogin();
  }

  //This method is used to login user by email and password
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
      //set user login details
      await AuthServiceController.setUserLoginDetails(res, context);
      return res;
    }
    return res;
  }
}
