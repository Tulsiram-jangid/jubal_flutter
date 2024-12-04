import 'package:flutter/material.dart';
import 'package:my_app/model/staticData/my_activity_model.dart';
import 'package:my_app/widget/activity_option.dart';
import 'package:my_app/widget/app_bar_widget.dart';

class MyActivity extends StatelessWidget {
  final List<MyActivityModel> list = MyActivityModel.getActivityList();

  void onTapItem(MyActivityModel item, BuildContext context){
    if(item.routeName.isNotEmpty){
      Navigator.of(context).pushNamed(item.routeName);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Your Activity"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final item = list[index];
                  return ActivityOption(
                    title: item.title,
                    onTap: (){
                      onTapItem(item,context);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: list.length)),
      ),
    );
  }
}
