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
  int pageNumber = 1;
  int totalPages = 1;
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    getHomeData();
  }

  void getHomeData() async {
    setState(() {
      activity = true;
    });
    try {
      ApiResponse res =
          await HomeServiceController.getHomeData(pageNumber: pageNumber);

      if (res.status) {
        setState(() {
          posts = res.data['posts'];
          totalPages = res.data['totalPages'];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: activity
          ? HomeShimmer()
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
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
    );
  }
}
