import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/api/ApiController/auth_service_controller.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/model/staticData/my_profile_model.dart';
import 'package:my_app/screen/appStart.dart';
import 'package:my_app/shimmer/my_profile_shimmer.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/bordered_text_with_icon_widget.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:my_app/widget/profile_header_widget.dart';
import 'package:my_app/widget/user_badge_widget.dart';
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
    final user = Provider.of<StoreProvider>(context).user;

    return Scaffold(
      appBar: null,
      body: !true
          ? MyProfileShimmer()
          : Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileHeaderWidget(
                      profileBanner: user!.profileBanner ?? "",
                      profilePhoto: user.profilePhoto ?? "",
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeadingWidget(title: user != null ? user.getFullName() ?? "" : ""),
                              const SizedBox(
                                width: 10,
                              ),
                              const UserBadgeWidget(),
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
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content: const Text("Are you sure want to logout?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("No")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      AuthServiceController.logoutUserFromApp(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => AppStart()),
                        (route) => false, // Remove all previous routes
                      );
                    },
                    child: const Text("Yes")),
              ],
            );
          });
    }
    if(item?.route_name != null && item.route_name.isNotEmpty){
      Navigator.of(context).pushNamed(item.route_name);
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
