import 'package:flutter/material.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:my_app/widget/app_image.dart';
import 'package:my_app/widget/back_button_widget.dart';
import 'package:provider/provider.dart';

class ProfileHeaderWidget extends StatelessWidget {

  final String profileBanner;
  final String profilePhoto;

  const ProfileHeaderWidget({
    super.key,
    required this.profileBanner,
    required this.profilePhoto
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<StoreProvider>(context).user;

    final imageHeight = 200.0;
    const itemSpacing = 60.0;

    return Stack(
      children: [
        Column(
          children: [
            AppImage(
              url: profileBanner,
              width: double.infinity,
              height: imageHeight,
              assetUrl: "assets/images/banner.png",
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
            child: profilePhoto != null ? CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profilePhoto ?? "", scale: 1),
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
