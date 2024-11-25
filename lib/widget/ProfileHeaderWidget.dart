import 'package:flutter/material.dart';
import 'package:my_app/widget/BackButtonWidget.dart';

class ProfileHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageHeight = 200.0;
    const itemSpacing = 60.0;

    return Stack(
      children: [
        Column(
          children: [
            Image.network(
              "https://designhub.co/wp-content/uploads/2020/09/Banner5.jpg",
              fit: BoxFit.fill,
              width: double.infinity,
              height: imageHeight,
            ),
            const SizedBox(
              width: double.infinity,
              height: itemSpacing,
            ),
          ],
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: itemSpacing * .2,
            child: CircleAvatar(
              radius: 50,
            )),
        Positioned(
            left: 10,
            top: 10,
            child: SafeArea(child: BackButtonWidget())
        )
      ],
    );
  }
}
