import 'package:flutter/material.dart';
import 'package:my_app/screen/auth/login.dart';
import 'package:my_app/screen/bottomTab/BottomTab.dart';
import 'package:my_app/screen/splash/splash.dart';
import 'package:my_app/store/StoreProvider.dart';
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
      Provider.of<StoreProvider>(context, listen: false).goToLogin();
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