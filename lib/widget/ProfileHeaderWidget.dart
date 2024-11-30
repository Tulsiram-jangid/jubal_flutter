import 'package:flutter/material.dart';
import 'package:my_app/store/StoreProvider.dart';
import 'package:my_app/widget/BackButtonWidget.dart';
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
              backgroundImage: NetworkImage(user != null && user.profilePhoto != null ? user.profilePhoto! : "", scale: 1),
            )),
        Positioned(
            left: 10, top: 10, child: SafeArea(child: BackButtonWidget()))
      ],
    );
  }
}
