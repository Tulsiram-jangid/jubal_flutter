import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged onItemTapped;

  const BottomNavigationBarWidget(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  onItemTapped(0);
                },
                icon: SvgPicture.asset('assets/icons/home.svg', color: selectedIndex == 0 ? AppColor.primary : AppColor.darkGrey,)),
            const Spacer(),
            IconButton(
                onPressed: () {
                  onItemTapped(1);
                },
                icon: SvgPicture.asset('assets/icons/search.svg', color: selectedIndex == 1 ? AppColor.primary : AppColor.darkGrey,)),
            const Spacer(),
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                color: AppColor.primary,
                shape: BoxShape.circle
              ),
              child: IconButton(
                onPressed: () {
                  onItemTapped(2);
                },
                icon: SvgPicture.asset('assets/icons/post.svg'),
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  onItemTapped(3);
                },
                icon: SvgPicture.asset('assets/icons/chat.svg', color: selectedIndex == 3 ? AppColor.primary : AppColor.darkGrey,)),
            const Spacer(),
            IconButton(
                onPressed: () {
                  onItemTapped(4);
                },
                icon: SvgPicture.asset('assets/icons/calendar.svg', color: selectedIndex == 4 ? AppColor.primary : AppColor.darkGrey,)),
          ],
        ),
      ),
    ));
  }
}
