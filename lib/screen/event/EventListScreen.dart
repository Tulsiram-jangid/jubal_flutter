import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventListScreen();
  }
}

class _EventListScreen extends State<EventListScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("event"),),
      body: Center(child: Text("event"),),
    );
  }
}