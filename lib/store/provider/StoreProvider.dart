import 'package:flutter/material.dart';
import 'package:my_app/model/PostModel.dart';
import 'package:my_app/model/user_model.dart';
import 'package:my_app/screen/appStart.dart';

class StoreProvider extends ChangeNotifier {
  int app_status = 0;
  UserModel? user = null;

  //For post
  List<dynamic> posts = [];
  int page = 1;
  int totalPage = 1;
  


  //for post
  void setPost(List<dynamic> _posts, int page, int? totalPage){
    this.posts = _posts;
    this.page = page;
    this.totalPage = totalPage ?? this.totalPage;
  }

  //For user
  void setUser(UserModel _user){
    this.user = _user;
  }

  UserModel getUser(){
    return this.user!;
  }

  void updateAppStatus(int app_status){
    this.app_status = app_status;
    notifyListeners();
  }

  void goToLogin(){
    this.app_status = 1;
    notifyListeners();
  }

  void goToHome(){
    this.app_status = 2;
    notifyListeners();
  }

  void onLogout(BuildContext context){
    this.app_status = 1;
    notifyListeners();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> AppStart()), (_)=>false);
  }
}