import 'package:flutter/material.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/model/staticData/tab_model.dart';
import 'package:my_app/screen/jubalStore/jubal_store_event.dart';
import 'package:my_app/screen/jubalStore/jubal_store_instrument.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/tab_list.dart';

class JubalStoreScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JubalStoreScreen();
  }
}

class _JubalStoreScreen extends State<JubalStoreScreen> {
  final List<TabModel> tabs = TabModel.getJubalStoreTabList();
  TabModel? selectedTab;

  @override
  void initState(){
    super.initState();
    initData();
  }

  void initData(){
    setState(() {
      selectedTab = tabs.first;
    });
  }

  void onTapItem(TabModel item){
    setState(() {
      selectedTab = item;
    });
  }

  Widget getSelectedTabBody(){
    if(selectedTab!.type == FieldTypes.instrument){
      return JubalStoreInstrument();
    }
    if(selectedTab!.type == FieldTypes.event){
      return JubalStoreEvent();
    }
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Jubal Store"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          TabList(list: tabs, onTapItem: onTapItem, selectedTab: selectedTab,),
          const SizedBox(height: 10,),
          getSelectedTabBody()
        ],),
      ),
    );
  }
}
