import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatListScreen();
  }
}

class _ChatListScreen extends State<ChatListScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("chat"),),
      body: Center(child: Text("chat"),),
    );
  }
}