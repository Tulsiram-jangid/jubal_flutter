import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/AppButton.dart';
import 'package:my_app/widget/BackButtonWidget.dart';
import 'package:my_app/widget/BorderedTextWithIconWidget.dart';
import 'package:my_app/widget/HeadingWidget.dart';
import 'package:my_app/widget/UserBadgeWidget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageHeight = 200.0;

    return Column(children: [
      Stack(
        children: [
          Positioned(
            child: Image.network(
              "https://designhub.co/wp-content/uploads/2020/09/Banner5.jpg",
              fit: BoxFit.fill,
              width: double.infinity,
              height: imageHeight,
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              clipBehavior: Clip.none,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: CircleAvatar(),
                        ),
                        const SizedBox(height: 5,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                          HeadingWidget(title: "Mohan kumar"),
                          const SizedBox(width: 10,),
                          UserBadgeWidget(),
                        ],),
                        Text("Musician", style: TextStyle(color: AppColor.darkGrey, fontSize: 14),),
                        const SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                          BorderedTextWithIconWidget(title: "Followers"),
                          const SizedBox(width: 10,),
                          BorderedTextWithIconWidget(title: "Followers")
                        ],),
                        const SizedBox(height: 20,),
                        AppButton(title: "Follow", onTap: (){})
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 10,
            child: SafeArea(
              child: SizedBox(
                width: 60,
                height: 60,
                child: BackButtonWidget(),
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
