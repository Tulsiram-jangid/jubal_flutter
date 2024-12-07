import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';

class AppConstant {
  static BuildContext? context;
  static String? fcmToken;
  static String? userToken;
  static String? userId;

  static const String defaultCountryCode = "+1";
  static Country? defaultCountry = CountryPickerUtils.getCountryByPhoneCode("1");

  static const pageLimit = 10;

  static setUserToken(String token) {
    userToken = token;
    print("---------user token-----------${userToken}");
  }

  static setUserId(String id) {
    userId = id;
    print("---------user id-----------${userId}");
  }

  static setFcmToken(String token) {
    fcmToken = token;
    print("---------fcm token-----------${fcmToken}");
  }
}
