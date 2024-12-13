import 'package:flutter/material.dart';

class UserCircleImage extends StatelessWidget {
  final double radius;
  final String url;
  final Color color;

  UserCircleImage(
      {super.key,
      this.radius = 18,
      this.url =
          "https://cdn.pixabay.com/photo/2017/12/08/11/53/event-party-3005668_640.jpg",
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    double size = radius * 2;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(size)),
      child: CircleAvatar(
        backgroundImage: NetworkImage(url),
        radius: radius,
      ),
    );
  }
}
