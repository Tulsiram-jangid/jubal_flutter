import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/post_service_controller.dart';
import 'package:my_app/shimmer/list_shimmer.dart';
import 'package:my_app/widget/liked_post.dart';

class MyLikedPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyLikedPost();
  }
}

class _MyLikedPost extends State<MyLikedPost> {
  //List<int> list = [1];
  bool activity = !true;
  List<dynamic> list = [];
  int page = 1;
  int totalPage = 1;

  void initState(){
    super.initState();
    getPostLike(1);
  }

  Future<void> getPostLike(int page)async{
    setState(() {
      activity = true;
    });
    final res = await PostServiceController.getPostLikes(page: page);
    setState(() {
      activity = false;
      list = res.data['Likes'] ?? [];
      totalPage = res.data['totalPages'] ?? 1;
      page = page;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: activity ? ListShimmer() : ListView.separated(
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
