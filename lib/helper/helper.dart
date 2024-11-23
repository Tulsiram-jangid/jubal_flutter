import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class Helper {
  static void showToast(BuildContext context, String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: const Duration(seconds: 5))
    );
  }
}