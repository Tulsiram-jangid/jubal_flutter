import 'package:flutter/material.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/tagged_post.dart';

class MyTaggedPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTaggedPost();
  }

}

class _MyTaggedPost extends State<MyTaggedPost>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Tags"),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TaggedPost()
        ],),
      ),
    );
  }
}