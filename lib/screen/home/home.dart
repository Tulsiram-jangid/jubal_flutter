import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/home_service_controller.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/model/PostModel.dart';
import 'package:my_app/route/routeName.dart';
import 'package:my_app/screen/bottomTab/BottomNavigationBarWidget.dart';
import 'package:my_app/shimmer/home_shimmer.dart';
import 'package:my_app/widget/HomeAppBar.dart';
import 'package:my_app/widget/HomePostWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  bool activity = false;
  bool footerActivity = false;
  int pageNumber = 1;
  int totalPages = 1;
  List<dynamic> posts = [];

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getHomeData(1);
    scrollController.addListener(() {
      print("${scrollController.position.pixels}");
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMorePost();
      }
    });
  }

  void getHomeData(int page) async {
    setState(() {
      activity = true;
    });
    try {
      ApiResponse res =
          await HomeServiceController.getHomeData(pageNumber: page);

      if (res.status) {
        setState(() {
          posts = res.data['posts'];
          totalPages = res.data['totalPages'];
          activity = false;
          pageNumber = page;
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

  Future<void> loadMorePost() async {
    if (pageNumber < totalPages) {
      int page = pageNumber + 1;
      setState(() {
        footerActivity = true;
      });
      try {
        List<dynamic> result = await Future.wait([
          HomeServiceController.getHomeData(pageNumber: page),
        ]);
        ApiResponse res = result[0];
        if (res.status) {
          setState(() {
            posts.addAll(res.data['posts'].length > 0 ? res.data['posts'] : []);
            pageNumber = page;
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
                      if (index == posts.length - 1 && footerActivity) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      final post = posts[index];
                      return HomePostWidget(
                        post: post,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: posts.length),
              ),
            ),
    );
  }
}
