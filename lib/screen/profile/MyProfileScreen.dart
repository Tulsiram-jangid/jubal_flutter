import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/model/staticData/MyProfileModel.dart';
import 'package:my_app/screen/appStart.dart';
import 'package:my_app/shimmer/MyProfileShimmer.dart';
import 'package:my_app/store/StoreProvider.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/AppButton.dart';
import 'package:my_app/widget/BorderedTextWithIconWidget.dart';
import 'package:my_app/widget/HeadingWidget.dart';
import 'package:my_app/widget/ProfileHeaderWidget.dart';
import 'package:my_app/widget/UserBadgeWidget.dart';
import 'package:provider/provider.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyProfileScreen();
  }
}

class _MyProfileScreen extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: null,
      body: !true
          ? MyProfileShimmer()
          : Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileHeaderWidget(),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeadingWidget(title: "Mohan kumar"),
                              const SizedBox(
                                width: 10,
                              ),
                              UserBadgeWidget(),
                            ],
                          ),
                          const Text(
                            "Musician",
                            style: TextStyle(
                                color: AppColor.darkGrey, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BorderedTextWithIconWidget(title: "Followers"),
                              const SizedBox(
                                width: 10,
                              ),
                              BorderedTextWithIconWidget(title: "Followers")
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppButton(title: "Follow", onTap: () {}),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(width: deviceWidth, child: ProfileItems()),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class ProfileItems extends StatelessWidget {
  final List<MyProfileHeadingModel> profileItems =
      MyProfileHeadingModel.getMyProfileTabList();

  ProfileItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: profileItems.map((profileItem) {
        return ProfileItemHeading(
          title: profileItem.title,
          items: profileItem.list,
        );
      }).toList(),
    );
  }
}

class ProfileItemHeading extends StatelessWidget {
  final String title;
  final List<MyProfileModel>? items;

  ProfileItemHeading({super.key, required this.title, this.items});

  void onItemTap(BuildContext context, MyProfileModel item) {
    if (item.type == MyProfileTypes.logout) {
      Provider.of<StoreProvider>(context, listen: false).onLogout(context);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => AppStart()),
        (route) => false, // Remove all previous routes
      );
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        color: Colors.grey[300],
        child: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
      ),
      if (items != null && items!.isNotEmpty)
        const SizedBox(
          height: 10,
        ),
      ...items!.asMap().entries.map((entry) {
        int index = entry.key; // The index
        var item = entry.value; // The item at that index

        return ProfileItem(
          title: item.title,
          showDivider: index != items!.length - 1,
          icon: item.icon,
          onTap: () {
            onItemTap(context, item);
          }, // Example: hide divider for the last item
        );
      }).toList(),
    ]);
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final bool showDivider;
  final Widget? icon;
  final VoidCallback? onTap;

  ProfileItem(
      {super.key,
      required this.title,
      this.showDivider = false,
      this.icon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    double iconSize = 40;

    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                //color: Colors.grey[300],
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(iconSize)),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: icon ??
                      SvgPicture.asset(
                        "assets/icons/profileUser.svg",
                        color: AppColor.darkGrey,
                      ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider()
        else
          const SizedBox(
            height: 5,
          )
      ]),
    );
  }
}
