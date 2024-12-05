import 'package:flutter/material.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:my_app/widget/back_button_widget.dart';
import 'package:provider/provider.dart';

class ProfileHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<StoreProvider>(context).user;

    final imageHeight = 200.0;
    const itemSpacing = 60.0;

    return Stack(
      children: [
        Column(
          children: [
            if (user != null && user.profileBanner != null)
              Image.network(
                user.profileBanner!,
                fit: BoxFit.fill,
                width: double.infinity,
                height: imageHeight,
              ) else Image.asset(
                "assets/images/banner.png",
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
            child: user != null && user.profilePhoto != null ? CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user != null && user.profilePhoto != null ? user.profilePhoto! : "", scale: 1),
            ) : const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50,) ,
            ),
            ), 
        Positioned(
            left: 10, top: 10, child: SafeArea(child: BackButtonWidget()))
      ],
    );
  }
}
