import 'package:my_app/route/route_name.dart';

class MyActivityModel {
  final String title;
  final String routeName;

  MyActivityModel({
    required this.title,
    required this.routeName
  });

  static List<MyActivityModel> getActivityList(){
    List<MyActivityModel> list = [];
    list.add(MyActivityModel(
      title: "Likes",
      routeName: RouteNames.myLike
    ));
    list.add(MyActivityModel(
      title: "Comments",
      routeName: RouteNames.myLike
    ));
    list.add(MyActivityModel(
      title: "Reviews",
      routeName: RouteNames.myLike
    ));
    list.add(MyActivityModel(
      title: "Tags",
      routeName: RouteNames.myLike
    ));
    list.add(MyActivityModel(
      title: "Shared",
      routeName: RouteNames.myLike
    ));
    return list;
  }

}