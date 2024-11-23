import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/utils/appColor.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF891B3B),Color(0xFF510927)])
        ),
        child: Center(
        child: Image.asset('assets/images/logo.png', width: 120.0, height: 120.0, fit: BoxFit.contain,),
      ),),
    );
  }
}
