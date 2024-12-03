import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class AppStatusWidget extends StatelessWidget {

  final String? status;

  AppStatusWidget({
    super.key,
    this.status
  });

  Color getColor(){
    if(status == "Completed"){
      return Color(0XFF90B10C).withOpacity(.15);
    }
    return AppColor.primary;
  }

  Color getTextColor(){
    if(status == "Completed"){
      return Color(0XFF90B10C).withOpacity(1);
    }
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: getColor(),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(status ?? "", style: TextStyle(fontSize: 9, color: getTextColor(), fontWeight: FontWeight.bold),),
    );
  }
}
