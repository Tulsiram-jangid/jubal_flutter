import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screen/bottomTab/bottom_navigation_bar_widget.dart';
import 'package:my_app/screen/chat/chat_list_screen.dart';
import 'package:my_app/screen/event/event_list_screen.dart';
import 'package:my_app/screen/home/home.dart';
import 'package:my_app/screen/post/add_post_screen.dart';
import 'package:my_app/screen/talent/talent_list_screen.dart';

class BottomTabScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BottomTabScreen();
  }
}

class _BottomTabScreen extends State<BottomTabScreen> {
  int _selectedIndex = 0;

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
    return Scaffold(
      appBar: null,
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => _onItemTapped(index),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          // Your screens for each tab
          HomeScreen(),
          TalentListScreen(),
          AddPostScreen(),
          ChatListScreen(),
          EventListScreen(),
        ],
      ),
    );
  }
}
