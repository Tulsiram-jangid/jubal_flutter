import 'package:flutter/material.dart';
import 'package:my_app/widget/liked_post.dart';

class MyLikedPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyLikedPost();
  }
}

class _MyLikedPost extends State<MyLikedPost> {
  List<int> list = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return LikedPost();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: list.length),
      ),
    );
  }
}
