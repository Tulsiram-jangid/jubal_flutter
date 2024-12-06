import 'package:flutter/material.dart';
import 'package:my_app/shimmer/shimmer_container.dart';

class ListShimmer extends StatelessWidget {
  final double height = 180;
  @override
  Widget build(BuildContext context) {
    final list = List.generate(5, (index) => index);
    return ShimmerContainer(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ShimmerCard(height: height);
        },
        itemCount: list.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  final double? height;

  ShimmerCard({
    super.key,
    this.height
  });


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
    );
  }
}
