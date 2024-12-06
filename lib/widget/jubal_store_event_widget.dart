import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/dot_status.dart';
import 'package:my_app/widget/heading_widget.dart';

class JubalStoreEventWidget extends StatelessWidget {
  final String URL =
      "https://media.istockphoto.com/id/894058154/photo/musical-instruments.jpg?s=612x612&w=0&k=20&c=uB0TFyqeY1wu1BPyH2EB7NMoOCaSb86pk7YNQ5QVCGQ=";

  Widget get item_spacer {
    return const SizedBox(
      height: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HeadingWidget(
                title: "December 06,24 10:00AM to 11:00 AM",
                isText: true,
                textFontSize: 10,
              ),
              const Spacer(),
              const DotStatus()
            ],
          ),
          item_spacer,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              URL,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          item_spacer,
          HeadingWidget(
            title: "Nigh party",
            fontSize: 14,
          ),
          item_spacer,
          Row(
            children: [
              HeadingWidget(
                title: "Nigh party",
                fontSize: 14,
                color: AppColor.darkGrey,
              ),
              const Spacer(),
              Text("View Detail", style: TextStyle(color: AppColor.primary, fontSize: 14, decoration: TextDecoration.combine([
                TextDecoration.underline,
              ]),decorationColor: AppColor.primary, decorationStyle: TextDecorationStyle.solid),)
            ],
          ),
        ],
      ),
    );
  }
}
