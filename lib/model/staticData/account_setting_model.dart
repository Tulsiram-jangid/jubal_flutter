import 'package:flutter/material.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:provider/provider.dart';

class AccountSettingModel {
  final String title;
  final String routeName;

  AccountSettingModel({required this.title, required this.routeName});

  static List<AccountSettingModel> getAccountListOptions() {
    List<AccountSettingModel> list = [];
    list.add(AccountSettingModel(
        title: "Password and Security",
        routeName: RouteNames.changePasswordScreen));
    list.add(AccountSettingModel(
        title: "Personal Details", routeName: RouteNames.profileDetailScreen));
    list.add(AccountSettingModel(
        title: "Update field interest",
        routeName: RouteNames.userCategoryScreen));
    list.add(AccountSettingModel(
        title: "Share your profile",
        routeName: RouteNames.accountSettingScreen));
    return list;
  }

  static List<AccountSettingModel> getUserCategoryList(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context, listen: false);
    final user = storeProvider.user;
    List<AccountSettingModel> list = [];
    if (user != null && user.type == UserTypes.talent.value) {
      list.add(AccountSettingModel(
          title: "Primary Category",
          routeName: RouteNames.primaryCategoryScreen));
      list.add(AccountSettingModel(
          title: "Primary musical instrument",
          routeName: RouteNames.primaryCategoryScreen));
      list.add(AccountSettingModel(
          title: "Music genre", routeName: RouteNames.primaryCategoryScreen));
    } else {
      list.add(AccountSettingModel(
          title: "Services", routeName: RouteNames.userServiceScreen));
    }

    list.add(AccountSettingModel(
        title: "Social accounts", routeName: RouteNames.profileDetailScreen));
    return list;
  }
}
