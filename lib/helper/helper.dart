import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class Helper {
  static void showToast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), duration: const Duration(seconds: 5)));
  }

  static void showAlert(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(color: Colors.black, fontSize: 18,),),
          content: Text(msg, style: TextStyle(color: Colors.grey, fontSize: 14),),
          actions: [TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("Ok"))],
        );
      },
    );
  }
}
