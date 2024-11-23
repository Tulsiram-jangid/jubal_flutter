import 'package:flutter/material.dart';
import 'package:my_app/screen/auth/login.dart';
import 'package:my_app/screen/bottomTab/BottomTab.dart';
import 'package:my_app/screen/home/home.dart';
import 'package:my_app/screen/splash/splash.dart';

class AppStart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppStart();
  }
  
}

class _AppStart extends State<AppStart>{

  int appStatus = 2;

  @override
  Widget build(BuildContext context) {
    if(appStatus == 0){
      return SplashScreen();
    }
    if(appStatus == 1){
      return LoginScreen();
    }
    if(appStatus == 2){
      return BottomTabScreen();
    }
    return Container(child: Center(child: const Text("Not found"),),);
  }
}