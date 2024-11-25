import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/utils/appColor.dart';

class UserBadgeWidget extends StatelessWidget {

  final bool? isTalent;

  const UserBadgeWidget({
    super.key,
    this.isTalent=true
  });

  @override
  Widget build(BuildContext context) {
    return Container(child: const Row(children: [
      Text("Talent", style: const TextStyle(color: AppColor.primary, fontWeight: FontWeight.bold),),
      const SizedBox(width: 5,),
     Icon(Icons.verified, color: AppColor.primary,size: 15,),
    ],),);
  }
  
}