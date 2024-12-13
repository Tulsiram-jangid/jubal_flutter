import 'package:flutter/material.dart';
import 'package:my_app/api/baseUrl.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/logged_in_user.dart';
import 'package:my_app/model/user_model.dart';
import 'package:my_app/store/SharedPrefrenceStorage.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:provider/provider.dart';

class AuthServiceController {
  //This method sets the basic user login details
  static setUserLoginDetails(ApiResponse res, BuildContext context) async {
    await setUserToSharedPreference(res.data);
    if (res.data.containsKey("accessToken")) {
      AppConstant.setUserToken(res.data['accessToken']);
    }
    if (res.data.containsKey("refreshToken")) {
      AppConstant.setRefreshToken(res.data['refreshToken']);
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
        //first check if token is valid or not
        AppConstant.setUserToken(obj['accessToken']);
        bool isTokenExpired = await AuthServiceController.isTokenExpired();
        if (isTokenExpired) {
          Provider.of<StoreProvider>(context, listen: false).goToLogin();
          return;
        }
      }

      if (obj.containsKey("refreshToken")) {
        AppConstant.setRefreshToken(obj['refreshToken']);
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

  static void logoutUserFromApp(BuildContext context) async {
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

  static Future<bool> validateMobileEmailAndUsername(
      {String? email,
      String? mobile,
      String? countryCode,
      String? username,
      BuildContext? context}) async {
    const URL = ApiUrl.authCheck;

    //validate if email is exist or not
    if (email != null && email.isNotEmpty) {
      final body = {"email": email};
      ApiResponse res =
          await ApiRequest.request(url: URL, method: "POST", body: body);
      if (res.status) {
        if (res.data != null) {
          const msg =
              "This email address has already been registered, try other one";
          if (context != null) {
            Helper.showAlert(context, "Already Registered", msg);
          }
          return false;
        }
      }
    }
    //validate if username is exist or not
    if (username != null && username.isNotEmpty) {
      final body = {"username": username};
      ApiResponse res =
          await ApiRequest.request(url: URL, method: "POST", body: body);
      if (res.status) {
        if (res.data != null) {
          const msg = "This username has already been taken, try other one";
          if (context != null) {
            Helper.showAlert(context, "Already Registered", msg);
          }
          return false;
        }
      }
    }

    //validate mobile number
    if (mobile != null &&
        mobile.isNotEmpty &&
        countryCode != null &&
        countryCode.isNotEmpty) {
      final body = {"phone": mobile, "countryCode": countryCode};
      ApiResponse res =
          await ApiRequest.request(url: URL, method: "POST", body: body);
      if (res.status) {
        if (res.data != null) {
          const msg =
              "This mobile number has already been registered, try other one";
          if (context != null) {
            Helper.showAlert(context, "Already Registered", msg);
          }
          return false;
        }
      }
    }

    return true;
  }

  static Future<ApiResponse> registerUser({
    Map<String, dynamic>? body,
  }) async {
    const URL = ApiUrl.register;
    ApiResponse res =
        await ApiRequest.request(url: URL, method: "POST", body: body);
    return res;
  }

  static Future<bool> isTokenExpired() async {
    const URL = ApiUrl.validateToken;
    ApiResponse res = await ApiRequest.request(
      url: URL,
      method: "GET",
    );
    return !res.status;
  }

  static Future<void> refreshNewToken() async {
    const URL = ApiUrl.validateToken;
    ApiResponse res = await ApiRequest.request(
      url: URL,
      method: "GET",
    );
    if (res.status) {}
  }

  static Future<bool> changePassword ({
    dynamic body,
    BuildContext? context
  })async {
    const URL = ApiUrl.changePassword;
    final res = await ApiRequest.request(
      url: URL,
      method: "POST",
      body: body
    );
    if(ApiRequest.isSuccess(res.toJosn(), context)){
      
    }
    return res.status;
  }
}
