import 'package:flutter/material.dart';
import 'package:my_app/shimmer/shimmer_container.dart';

class InstrumentDetailShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return ShimmerContainer(child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
        width: double.infinity,
        height: 300,
        color: Colors.grey,
      ),
      const SizedBox(height: 20,),
      Container(
        width: _width *.8,
        height: 20,
        color: Colors.grey,
      ),
      const SizedBox(height: 10,),
      Container(
        width: _width *.7,
        height: 10,
        color: Colors.grey,
      ),
      const SizedBox(height: 10,),
      Container(
        width: _width *.6,
        height: 10,
        color: Colors.grey,
      ),
      const SizedBox(height: 10,),
      Container(
        width: _width *.5,
        height: 10,
        color: Colors.grey,
      ),


      const SizedBox(height: 30,),
      Container(
        width: _width *.8,
        height: 20,
        color: Colors.grey,
      ),
      const SizedBox(height: 10,),
      Container(
        width: _width *.7,
        height: 10,
        color: Colors.grey,
      ),
      const SizedBox(height: 10,),
      Container(
        width: _width *.6,
        height: 10,
        color: Colors.grey,
      ),
      const SizedBox(height: 10,),
      Container(
        width: _width *.5,
        height: 10,
        color: Colors.grey,
      ),
    ],),);
  }
  
}