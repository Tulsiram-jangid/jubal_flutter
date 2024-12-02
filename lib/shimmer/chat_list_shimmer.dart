import 'package:flutter/material.dart';
import 'package:my_app/shimmer/shimmer_container.dart';

class ChatListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = List.generate(10, (index) => index);

    return ShimmerContainer(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ChatListCard();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: list.length,
      ),
    );
  }
}

class ChatListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      //color: Colors.grey,
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  height: 10,
                  color: Colors.grey,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
