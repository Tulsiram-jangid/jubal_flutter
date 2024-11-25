import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/AppBarWidget.dart';
import 'package:my_app/widget/ChatListWidget.dart';
import 'package:my_app/widget/SeachTextField.dart';

class ChatListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatListScreen();
  }
}

class _ChatListScreen extends State<ChatListScreen> {
  final List<String> items = List.generate(20, (index) => 'items ${index}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBarWidget(
        title: "Chat",
        isHaveBackButton: false,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: AppColor.primary,
                height: 30, // Height of the colored container
                width: double.infinity,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Positioned(
                  top: 0,
                  left: 10,
                  right: 10,
                  child: SearchTextField(
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ChatListWidget();
                    },
                    separatorBuilder: (context,index){
                      return const SizedBox(height: 10,);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
