import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final bool isText;
  final double? fontSize;
  final double? textFontSize;

  HeadingWidget(
      {super.key,
      required this.title,
      this.color = Colors.black,
      this.isText = false,
      this.fontSize=18,
      this.textFontSize = 12
      });

  @override
  Widget build(BuildContext context) {
    if (isText) {
      return Text(
        title,
        style: TextStyle(
            fontSize: textFontSize,
            fontWeight: FontWeight.w400,
            color: color ?? AppColor.darkGrey),
      );
    }
    return Text(
      title,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
    );
  }
}
