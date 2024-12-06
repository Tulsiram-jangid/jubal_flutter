import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/post_service_controller.dart';
import 'package:my_app/model/post/post_like_model.dart';
import 'package:my_app/shimmer/list_shimmer.dart';
import 'package:my_app/widget/footer_activity.dart';
import 'package:my_app/widget/liked_post.dart';

class MyLikedPost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyLikedPost();
  }
}

class _MyLikedPost extends State<MyLikedPost> {
  bool activity = !true;
  bool footerActivity = !true;
  List<dynamic> list = [];
  int page = 1;
  int totalPage = 1;
  ScrollController scrollController = ScrollController();

  void initState() {
    super.initState();
    getPostLike(1);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreLike();
      }
    });
  }

  Future<void> getPostLike(int page) async {
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

  Future<void> loadMoreLike() async {
    if (page < totalPage) {
      int newPage = page + 1;
      setState(() {
        footerActivity = true;
      });
      final res = await PostServiceController.getPostLikes(page: newPage);
      setState(() {
        footerActivity = false;
        list.addAll(res.data['Likes'] ?? []);
        page = newPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: activity
            ? ListShimmer()
            : ListView.separated(
                controller: scrollController,
                itemBuilder: (context, index) {
                  if(index == list.length-1 && footerActivity){
                    return FooterActivity();
                  }
                  final item = list[index];
                  return LikedPost(
                    post: PostLikeModel(postLike: item),
                  );
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
