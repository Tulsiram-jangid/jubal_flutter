import 'package:flutter/material.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:my_app/widget/user_badge_widget.dart';

class InstrumentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String URL =
        "https://cdn.pixabay.com/photo/2017/12/08/11/53/event-party-3005668_640.jpg";

    double imgHeight = 100;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              URL,
              width: imgHeight,
              height: imgHeight,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            HeadingWidget(title: "Electronic gitar"),
            const SizedBox(height: 5,),
            HeadingWidget(title: "Electronic gitar", isText: true,),
            const SizedBox(height: 5,),
            Row(children: [
              HeadingWidget(title: "Mohan kumar", isText: true,),
              const SizedBox(width: 8,),
              UserBadgeWidget(),
            ],),
            const SizedBox(height: 5,),
            HeadingWidget(title: Helper.getPrice(99)),
          ],)
        ],
      ),
    );
  }
}
