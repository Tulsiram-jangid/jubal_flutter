import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final Color? color;

  HeadingWidget({
    super.key,
    required this.title,
    this.color = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),);
  }
  
}