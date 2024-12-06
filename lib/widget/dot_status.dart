import 'package:flutter/material.dart';

class DotStatus extends StatelessWidget {

  final String? status;
  final Color color = Colors.red;

  const DotStatus({
    super.key,
    this.status
  });

  @override
  Widget build(BuildContext context) {
    double dotSize = 10;
    return Row(children: [
      Container(
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20)
        ),
      ),
      const SizedBox(width: 5,),
      Text("Pending", style: TextStyle(color: color, fontSize: 10),)
    ],);
  }
  
}