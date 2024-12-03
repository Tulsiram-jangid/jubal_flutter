import 'package:flutter/material.dart';
import 'package:my_app/shimmer/shimmer_container.dart';

class EventDetailShimmer extends StatelessWidget {
  const EventDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ShimmerContainer(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
        width: double.infinity,
        height: 200,
        color: Colors.grey,
      ),
      const SizedBox(height: 10,),
      Container(
        width: width*.8,
        height: 10,
        color: Colors.grey,
      ),
      const SizedBox(height: 10,),
      Container(
        width: width*.7,
        height: 10,
        color: Colors.grey,
      ),
      const SizedBox(height: 10,),
      Container(
        width: width*.6,
        height: 10,
        color: Colors.grey,
      ),
      const SizedBox(height: 20,),
      Container(
        width: width,
        height: 15,
        color: Colors.grey,
      ),
      const SizedBox(height: 20,),
      Container(
        width: width,
        height: 15,
        color: Colors.grey,
      ),
      const SizedBox(height: 20,),
      Container(
        width: width,
        height: 15,
        color: Colors.grey,
      ),
    ],),);
  }
}