import 'package:flutter/cupertino.dart';

class TotalResultWidget extends StatelessWidget {
  final String totalItem;

  TotalResultWidget({
    super.key,
    required this.totalItem
  });

  String get getText {
    return "Result : ${totalItem}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(getText, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),);
  }
}