import 'package:flutter/material.dart';
import 'package:my_app/route/routeName.dart';
import 'package:my_app/screen/appStart.dart';
import 'package:my_app/screen/auth/fanRegister.dart';
import 'package:my_app/screen/splash/splash.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (_) => AppStart());
      case RouteNames.fanRegisterScreen:
        return MaterialPageRoute(builder: (_) => FanRegisterScreen());
      default:
        return null;
    }
  }
}
