import 'package:flutter/material.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/user_comment.dart';

class MyComment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return _MyComment();
  }

}

class _MyComment extends State<MyComment>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Your Comments"),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          UserComment(),
          UserComment()
        ],),
        
      ),
    );
  }
}