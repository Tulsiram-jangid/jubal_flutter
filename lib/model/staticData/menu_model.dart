import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuModel {
  final String title;
  final int? badge;
  final Widget? icon;
  final Widget? screenWidget;

  static double iconSize = 10;

  MenuModel(
      {required this.title,this.badge, this.icon, this.screenWidget});

  static List<MenuModel> getMenuList() {
    List<MenuModel> list = [];

    list.add(MenuModel(
      title: "Jubal Store",
      icon: SvgPicture.asset('assets/icons/activity.svg', width: iconSize, height: iconSize,)
    ));
    list.add(MenuModel(
      title: "Your Activity",
      icon: SvgPicture.asset('assets/icons/activity.svg', width: iconSize, height: iconSize,)
    ));
    list.add(MenuModel(
      title: "Saved",
      icon: SvgPicture.asset('assets/icons/activity.svg', width: iconSize, height: iconSize,)
    ));
    list.add(MenuModel(
      title: "Favorite",
      icon: SvgPicture.asset('assets/icons/favorite.svg', width: iconSize, height: iconSize,)
    ));
    list.add(MenuModel(
      title: "My Orders",
      icon: SvgPicture.asset('assets/icons/activity.svg', width: iconSize, height: iconSize,)
    ));
    list.add(MenuModel(
      title: "Download your tickets",
      icon: SvgPicture.asset('assets/icons/download.svg', width: iconSize, height: iconSize,)
    ));
    list.add(MenuModel(
      title: "Shopping cart",
      icon: SvgPicture.asset('assets/icons/cart.svg', width: iconSize, height: iconSize,),
      badge: 2
    ));
    list.add(MenuModel(
      title: "How jubal works",
      icon: SvgPicture.asset('assets/icons/activity.svg', width: iconSize, height: iconSize,)
    ));
    list.add(MenuModel(
      title: "FAQ",
      icon: SvgPicture.asset('assets/icons/activity.svg', width: iconSize, height: iconSize,)
    ));
    list.add(MenuModel(
      title: "Privacy policy",
      icon: SvgPicture.asset('assets/icons/privacy.svg', width: iconSize, height: iconSize,)
    ));
    list.add(MenuModel(
      title: "Term of use",
      icon: SvgPicture.asset('assets/icons/term.svg', width: iconSize, height: iconSize,)
    ));
    return list;
  }
}
