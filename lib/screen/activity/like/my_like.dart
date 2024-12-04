import 'package:flutter/material.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/model/staticData/tab_model.dart';
import 'package:my_app/screen/activity/like/my_liked_event.dart';
import 'package:my_app/screen/activity/like/my_liked_instrument.dart';
import 'package:my_app/screen/activity/like/my_liked_post.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/tab_list.dart';

class MyLike extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyLike();
  }
}

class _MyLike extends State<MyLike> {
  final List<TabModel> tabs = TabModel.getMyLikeTabList();
  TabModel? selectedTab;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() {
    setState(() {
      selectedTab = tabs.first;
    });
  }

  void onTapItem(TabModel item) {
    setState(() {
      selectedTab = item;
    });
  }

  Widget renderLikedWidget(){
    if(selectedTab!.type == FieldTypes.post){
      return MyLikedPost();
    }
    if(selectedTab!.type == FieldTypes.event){
      return MyLikedEvent();
    }
    if(selectedTab!.type == FieldTypes.instrument){
      return MyLikedInstrument();
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Your likes"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TabList(
              list: tabs,
              selectedTab: selectedTab,
              onTapItem: onTapItem,
            ),
            renderLikedWidget()
          ],
        ),
      ),
    );
  }
}
