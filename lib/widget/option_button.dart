import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/heading_widget.dart';

class OptionButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const OptionButton({
    super.key,
    required this.title,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(children: [
          HeadingWidget(title: title, fontSize: 14),
          const Spacer(),
          const Icon(Icons.chevron_right, color: AppColor.darkGrey,)
        ],),),
    );
  }
  
}