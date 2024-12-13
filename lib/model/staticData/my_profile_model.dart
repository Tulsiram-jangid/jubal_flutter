import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/utils/appColor.dart';

class MyProfileHeadingModel {
  final String title;
  final List<MyProfileModel>? list;

  MyProfileHeadingModel({required this.title, this.list});

  static List<MyProfileHeadingModel> getMyProfileTabList() {
    final iconColor = AppColor.darkGrey;
    final double iconSize = 16;

    List<MyProfileHeadingModel> myProfileHeading = [];
    myProfileHeading
        .add(MyProfileHeadingModel(title: "General information", list: [
      MyProfileModel(
          title: "Account Settings", route_name: RouteNames.accountSettingScreen),
      MyProfileModel(
        title: "Dashboard",
        route_name: RouteNames.myOrderScreen,
        icon: Icon(Icons.attach_money, color: iconColor),
      ),
      MyProfileModel(
        title: "Addresses",
        route_name: RouteNames.addressListScreen,
        icon: Icon(
          Icons.alternate_email,
          color: iconColor,
          size: iconSize,
        ),
      ),
      MyProfileModel(
        title: "Manage Request",
        route_name: RouteNames.myOrderScreen,
        icon: Icon(
          Icons.question_mark,
          color: iconColor,
          size: iconSize,
        ),
      ),
      MyProfileModel(title: "My Jubal", route_name: RouteNames.myOrderScreen),
      MyProfileModel(
        title: "Reviews",
        route_name: RouteNames.myOrderScreen,
        icon: SvgPicture.asset('assets/icons/star.svg',),
      ),
    ]));
    myProfileHeading.add(
        MyProfileHeadingModel(title: "Archived And Removed Content", list: [
      MyProfileModel(title: "Archived", route_name: RouteNames.myOrderScreen),
    ]));
    myProfileHeading
        .add(MyProfileHeadingModel(title: "General Settings", list: [
      MyProfileModel(
          title: "Active Plan", route_name: RouteNames.myOrderScreen),
      MyProfileModel(
          title: "Order And Invoice", route_name: RouteNames.myOrderScreen),
      MyProfileModel(
        title: "Invite Friends",
        route_name: RouteNames.myOrderScreen,
        icon: SvgPicture.asset('assets/icons/invite.svg'),
      ),
      MyProfileModel(
        title: "Support",
        route_name: RouteNames.myOrderScreen,
        icon: Icon(
          Icons.headset_mic,
          color: iconColor,
          size: iconSize,
        ),
      ),
      MyProfileModel(
        title: "Polices",
        route_name: RouteNames.myOrderScreen,
        icon: SvgPicture.asset('assets/icons/policie.svg'),
      ),
    ]));
    myProfileHeading.add(MyProfileHeadingModel(title: "Others", list: [
      MyProfileModel(
        title: "Logout",
        route_name: RouteNames.myOrderScreen,
        type: MyProfileTypes.logout,
        icon: Icon(
          Icons.logout,
          color: iconColor,
          size: iconSize,
        ),
      ),
    ]));
    return myProfileHeading;
  }
}

class MyProfileModel {
  final String title;
  final String route_name;
  final MyProfileTypes? type;
  final Widget? icon;

  MyProfileModel(
      {required this.title,
      required this.route_name,
      this.type = null,
      this.icon});
}
