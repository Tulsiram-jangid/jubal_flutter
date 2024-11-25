import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class BackButtonWidget extends StatelessWidget {

  final VoidCallback? backTap;

  BackButtonWidget({
    super.key,
    this.backTap
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
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.chevron_left, color: AppColor.primary,size: 32.0,),
      ),
    ),);
  }
}
