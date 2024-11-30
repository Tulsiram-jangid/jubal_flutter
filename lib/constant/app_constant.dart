import 'package:flutter/material.dart';

class AppConstant {
  static BuildContext? context;
  static String? fcmToken;
  static String? userToken;
  static String? userId;

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
