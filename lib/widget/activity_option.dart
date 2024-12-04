import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/heading_widget.dart';

class ActivityOption extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ActivityOption({
    super.key,
    this.title = "Likes",
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(children: [
          HeadingWidget(title: title, fontSize: 14, color: AppColor.darkGrey,),
          const Spacer(),
          const Icon(Icons.chevron_right, size: 30, color: AppColor.darkGrey,)
        ],),
      ),
    );
  }
  
}