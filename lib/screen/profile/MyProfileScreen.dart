import 'package:flutter/material.dart';
import 'package:my_app/widget/ProfileHeaderWidget.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyProfileScreen();
  }
}

class _MyProfileScreen extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        children: [
          ProfileHeaderWidget(),
        ],
      ),
    );
  }
}
