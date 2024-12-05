import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/auth_service_controller.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/model/user_model.dart';
import 'package:my_app/screen/auth/login.dart';
import 'package:my_app/screen/bottomTab/bottom_tab.dart';
import 'package:my_app/screen/splash/splash.dart';
import 'package:my_app/store/SharedPrefrenceStorage.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:provider/provider.dart';

class AppStart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppStart();
  }
  
}

class _AppStart extends State<AppStart>{

  int appStatus = 0;


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      AuthServiceController.setUserLoginFromSharedPreference(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    print("storeProvider======="+storeProvider.app_status.toString());


    if(storeProvider.app_status == 0){
      return SplashScreen();
    }
    if(storeProvider.app_status == 1){
      return LoginScreen();
    }
    if(storeProvider.app_status == 2){
      return BottomTabScreen();
    }
    return Container(child: Center(child: const Text("Not found"),),);
  }
}