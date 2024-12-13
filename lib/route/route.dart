import 'package:flutter/material.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/screen/account/account_setting.dart';
import 'package:my_app/screen/account/change_password.dart';
import 'package:my_app/screen/account/profile_detail.dart';
import 'package:my_app/screen/activity/comment/my_comment.dart';
import 'package:my_app/screen/activity/my_activity.dart';
import 'package:my_app/screen/activity/like/my_like.dart';
import 'package:my_app/screen/activity/tag/my_tagged_post.dart';
import 'package:my_app/screen/address/add_address_screen.dart';
import 'package:my_app/screen/address/address_list_screen.dart';
import 'package:my_app/screen/appStart.dart';
import 'package:my_app/screen/auth/fan_register.dart';
import 'package:my_app/screen/auth/otp_verify.dart';
import 'package:my_app/screen/event/event_detail_screen.dart';
import 'package:my_app/screen/instrument/instrument_detail.dart';
import 'package:my_app/screen/jubalStore/jubal_store_screen.dart';
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
      case RouteNames.myComment:
        return MaterialPageRoute(builder: (_) => MyComment());
      case RouteNames.myTag:
        return MaterialPageRoute(builder: (_) => MyTaggedPost());
      case RouteNames.jubalStore:
        return MaterialPageRoute(builder: (_) => JubalStoreScreen());
      case RouteNames.addressListScreen:
        return MaterialPageRoute(builder: (_) => AddListScreen());
      case RouteNames.accountSettingScreen:
        return MaterialPageRoute(builder: (_) => AccountSetting());
      case RouteNames.changePasswordScreen:
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case RouteNames.profileDetailScreen:
        return MaterialPageRoute(builder: (_) => ProfileDetail());
      default:
        return null;
    }
  }
}
