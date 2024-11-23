import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screen/home/BottomNavigationBarWidget.dart';
import 'package:my_app/widget/HomeAppBar.dart';
import 'package:my_app/widget/HomePostWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      bottomNavigationBar: BottomNavigationBarWidget(selectedIndex: _selectedIndex, onItemTapped: (index){_onItemTapped(index);}),
      body: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                HomePostWidget(),
                const SizedBox(
                  height: 20,
                ),
                HomePostWidget(),
                HomePostWidget(),
                HomePostWidget(),
                HomePostWidget(),
                HomePostWidget(),
                HomePostWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
