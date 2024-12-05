import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/home_service_controller.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/model/PostModel.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/screen/bottomTab/bottom_navigation_bar_widget.dart';
import 'package:my_app/shimmer/home_shimmer.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:my_app/widget/home_app_bar.dart';
import 'package:my_app/widget/home_post_widget.dart';
import 'package:my_app/widget/footer_activity.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  bool activity = false;
  bool footerActivity = false;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getHomeData(1);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMorePost();
      }
    });
  }

  void getHomeData(int page) async {
    List<dynamic> _posts = Provider.of<StoreProvider>(context).posts;
    if(_posts.isNotEmpty){
      return;
    }
    setState(() {
      activity = true;
    });
    try {
      ApiResponse res =
          await HomeServiceController.getHomeData(pageNumber: page);

      if (res.status) {
        updatePostList(
            list: res.data['posts'] ?? [],
            page: page,
            totalPage: res.data['totalPages']);
        setState(() {
          activity = false;
        });
        return;
      }
      setState(() {
        activity = false;
      });
    } catch (e) {
      print("unable to get data");
      setState(() {
        activity = false;
      });
    }
  }

  void updatePostList({
    List<dynamic>? list,
    int? page,
    int? totalPage,
  }) {
    Provider.of<StoreProvider>(context, listen: false)
        .setPost(list ?? [], page ?? 1, totalPage);
  }

  Future<void> loadMorePost() async {
    int pageNumber = Provider.of<StoreProvider>(context).page;
    int totalPages = Provider.of<StoreProvider>(context).totalPage;

    if (pageNumber < totalPages) {
      int page = pageNumber + 1;
      setState(() {
        footerActivity = true;
      });
      try {
        List<dynamic> _posts = Provider.of<StoreProvider>(context).posts;

        List<dynamic> result = await Future.wait([
          HomeServiceController.getHomeData(pageNumber: page),
        ]);
        ApiResponse res = result[0];
        if (res.status) {
          updatePostList(
              list: [..._posts, ...res.data['posts'] ?? []], page: page,totalPage: totalPages);
          setState(() {
            footerActivity = false;
          });
          return;
        }
        setState(() {
          footerActivity = false;
        });
      } catch (e) {
        print("unable to get data");
        setState(() {
          footerActivity = false;
        });
      }
    }
    return;
  }

  Future<void> refreshPosts() async {
    getHomeData(1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> _posts = Provider.of<StoreProvider>(context).posts;

    return Scaffold(
      appBar: HomeAppBar(),
      body: activity
          ? HomeShimmer()
          : RefreshIndicator(
              onRefresh: refreshPosts,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                    controller: scrollController,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index == _posts.length - 1 && footerActivity) {
                        return FooterActivity();
                      }
                      final post = _posts[index];
                      return HomePostWidget(
                        post: post,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: _posts.length),
              ),
            ),
    );
  }
}
