import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/utils/appColor.dart';

class BorderedTextWithIconWidget extends StatelessWidget {
  final String title;

  BorderedTextWithIconWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.darkGrey, width: 1),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 15,height: 15,child: SvgPicture.asset(
              'assets/icons/user1.svg',
              color: AppColor.darkGrey,
            ),),
            const SizedBox(width: 5,),
            Text(title, style: TextStyle(color: AppColor.darkGrey),),
            const SizedBox(width: 5,),
            Icon(Icons.keyboard_arrow_down, color: AppColor.darkGrey,)
          ],
        ),
      ),
    );
  }
}
