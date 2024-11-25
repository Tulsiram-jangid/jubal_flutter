import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/widget/AppBarWidget.dart';
import 'package:my_app/widget/SeachTextField.dart';

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
      appBar: AppBarWidget(title: "Jubal Events", isHaveBackButton: false,),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [SearchTextField(placeholder: "Search events...",), Spacer()],
        ),
      ),
    );
  }
}