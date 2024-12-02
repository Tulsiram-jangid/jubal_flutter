import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';

class ChatListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Row(children: [
          CircleAvatar(backgroundImage: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D"),),
          const SizedBox(width: 10,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text("Mohan kumar", style: TextStyle(fontWeight: FontWeight.bold),),
            Text("musician", style: TextStyle(color: AppColor.darkGrey),)
          ],)
        ],),
        ),
    );
  }
  
}