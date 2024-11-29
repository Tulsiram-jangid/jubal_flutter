import 'package:flutter/material.dart';
import 'package:my_app/route/routeName.dart';
import 'package:my_app/screen/appStart.dart';
import 'package:my_app/screen/auth/fanRegister.dart';
import 'package:my_app/screen/auth/otpVerify.dart';
import 'package:my_app/screen/profile/MyProfileScreen.dart';
import 'package:my_app/screen/search/countryScreen.dart';

class AppRoute {
  static Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (_) => AppStart());
      case RouteNames.fanRegisterScreen:
        return MaterialPageRoute(builder: (_) => FanRegisterScreen());
      case RouteNames.myProfileScreen:
        return MaterialPageRoute(builder: (_) => MyProfileScreen());
      case RouteNames.otpVerifyScreen:
        return MaterialPageRoute(builder: (_) => OtpVerifyScreen());
      case RouteNames.searchCountryScreen:
        return MaterialPageRoute(builder: (_) => CountryScreen());
      default:
        return null;
    }
  }
}
