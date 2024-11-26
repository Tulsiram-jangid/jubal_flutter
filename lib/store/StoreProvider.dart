import 'package:flutter/material.dart';
import 'package:my_app/screen/appStart.dart';

class StoreProvider extends ChangeNotifier {
  int app_status = 0;

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