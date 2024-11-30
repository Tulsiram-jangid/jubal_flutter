import 'package:flutter/material.dart';
import 'package:my_app/shimmer/shimmer_container.dart';

class EventListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = List.generate(5, (index) => index);
    return ShimmerContainer(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return EventShimmerCard();
        },
        itemCount: list.length,
        padding: const EdgeInsets.all(10),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 30,
          );
        },
      ),
    );
  }
}

class EventShimmerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width * .8,
            height: 10,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width * .7,
            height: 10,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width * .6,
            height: 10,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
