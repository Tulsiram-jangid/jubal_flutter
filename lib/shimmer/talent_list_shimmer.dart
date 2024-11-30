import 'package:flutter/material.dart';
import 'package:my_app/shimmer/shimmer_container.dart';

class TalentListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = List.generate(10, (index) => index);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ShimmerContainer(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 120,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return TalentCardShimmer();
          },
          padding: const EdgeInsets.all(10),
          itemCount: list.length,
        ),
      ),
    );
  }
}

class TalentCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.48;
    final imageHeight = imageWidth + imageWidth *.2; // Adjust height proportionally
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: imageWidth,
          height: imageHeight,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: imageWidth*.8,
          height: 10,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: imageWidth*.7,
          height: 10,
          color: Colors.grey,
        )
      ],
    );
  }
}
