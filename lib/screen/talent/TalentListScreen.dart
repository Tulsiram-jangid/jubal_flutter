import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TalentListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TalentListScreen();
  }
}

class _TalentListScreen extends State<TalentListScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Talents"),),
      body: Center(child: Text("Talents"),),
    );
  }
}