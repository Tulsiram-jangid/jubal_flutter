import 'package:flutter/material.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/screen/activity/my_activity.dart';
import 'package:my_app/screen/activity/like/my_like.dart';
import 'package:my_app/screen/appStart.dart';
import 'package:my_app/screen/auth/fan_register.dart';
import 'package:my_app/screen/auth/otp_verify.dart';
import 'package:my_app/screen/event/event_detail_screen.dart';
import 'package:my_app/screen/profile/my_profile_screen.dart';
import 'package:my_app/screen/search/country_screen.dart';

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
      case RouteNames.eventDetailScreen:
        return MaterialPageRoute(builder: (_) => EventDetailScreen());
      case RouteNames.myActivity:
        return MaterialPageRoute(builder: (_) => MyActivity());
      case RouteNames.myLike:
        return MaterialPageRoute(builder: (_) => MyLike());
      default:
        return null;
    }
  }
}
