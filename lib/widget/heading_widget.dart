import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/utils/appColor.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final Color? color;
  final bool isText;
  final double? fontSize;
  final double? textFontSize; 
  final int? maxLines;
  final FontWeight? fontWeight;

  const HeadingWidget(
      {super.key,
      required this.title,
      this.color = Colors.black,
      this.isText = false,
      this.fontSize=18,
      this.textFontSize = 12,
      this.maxLines,
      this.fontWeight = FontWeight.w500
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
      // style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: color),
      style: GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
