import 'package:flutter/material.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/widget/add_action_widget.dart';
import 'package:my_app/widget/address_detail_widget.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:my_app/widget/add_action_widget.dart';

class AddListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddListScreen();
  }
}


class _AddListScreen extends State<AddListScreen>{

  void onAddPressed(){
    Navigator.of(context).pushNamed(RouteNames.addAddressScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Address",
      actions: [
        AddActionWidget(onPressed: onAddPressed,)
      ],),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          HeadingWidget(title: "Address"),
          const SizedBox(height: 5,),
          HeadingWidget(title: "Add common address that you want to use for collection or delivery here.", isText: true,),
          const SizedBox(height: 10,),
          AddressDetailWidget()
        ],),),
      ),
    );
  }
}
