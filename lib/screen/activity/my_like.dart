import 'package:flutter/material.dart';
import 'package:my_app/model/staticData/tab_model.dart';
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
          ],
        ),
      ),
    );
  }
}
