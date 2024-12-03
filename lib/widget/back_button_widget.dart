import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class BackButtonWidget extends StatelessWidget {

  final VoidCallback? backTap;
  final Color? bgColor;
  final Color? iconColor;

  BackButtonWidget({
    super.key,
    this.backTap,
    this.bgColor=Colors.white,
    this.iconColor = AppColor.primary
  });

  void onBackTap(BuildContext context){
    if(backTap != null) {
      backTap!();
    } else{
       Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      onBackTap(context);
    },child: Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: 35,
        height: 35,
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.chevron_left, color: iconColor,size: 32.0,),
      ),
    ),);
  }
}
