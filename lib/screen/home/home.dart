import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/route/routeName.dart';
import 'package:my_app/screen/bottomTab/BottomNavigationBarWidget.dart';
import 'package:my_app/shimmer/home_shimmer.dart';
import 'package:my_app/widget/HomeAppBar.dart';
import 'package:my_app/widget/HomePostWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool activity = !false;

  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Switch to the desired page in the PageView
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    // return HomeShimmer();
    return Scaffold(
      appBar: HomeAppBar(),
      body: activity ? HomeShimmer() : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              HomePostWidget(),
              const SizedBox(height: 20),
              HomePostWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
