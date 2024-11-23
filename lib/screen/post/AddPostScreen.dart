import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddPostScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPostScreen();
  }
}

class _AddPostScreen extends State<AddPostScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("post"),),
      body: Center(child: Text("post"),),
    );
  }
}