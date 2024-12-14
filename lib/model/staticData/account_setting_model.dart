import 'package:my_app/route/route_name.dart';

class AccountSettingModel {
  final String title;
  final String routeName;

  AccountSettingModel({
    required this.title,
    required this.routeName
  });

  static List<AccountSettingModel> getAccountListOptions(){
    List<AccountSettingModel> list = [];
    list.add(AccountSettingModel(
      title: "Password and Security",
      routeName: RouteNames.changePasswordScreen
    ));
    list.add(AccountSettingModel(
      title: "Personal Details",
      routeName: RouteNames.profileDetailScreen
    ));
    list.add(AccountSettingModel(
      title: "Update field interest",
      routeName: RouteNames.userCategoryScreen
    ));
    list.add(AccountSettingModel(
      title: "Share your profile",
      routeName: RouteNames.accountSettingScreen
    ));
    return list;
  }


  static List<AccountSettingModel> getUserCategoryList(){
    List<AccountSettingModel> list = [];
    list.add(AccountSettingModel(
      title: "Services",
      routeName: RouteNames.userServiceScreen
    ));
    list.add(AccountSettingModel(
      title: "Social accounts",
      routeName: RouteNames.profileDetailScreen
    ));
    return list;
  }
}