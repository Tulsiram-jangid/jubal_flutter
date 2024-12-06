import 'package:flutter/material.dart';
import 'package:my_app/model/event_list_model.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_image.dart';
import 'package:my_app/widget/dot_status.dart';
import 'package:my_app/widget/heading_widget.dart';

class JubalStoreEventWidget extends StatelessWidget {
  final String URL =
      "https://media.istockphoto.com/id/894058154/photo/musical-instruments.jpg?s=612x612&w=0&k=20&c=uB0TFyqeY1wu1BPyH2EB7NMoOCaSb86pk7YNQ5QVCGQ=";

  final EventListModel event;

  JubalStoreEventWidget({
    super.key,
    required this.event
  });

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
                title: event.getFormattedDate,
                isText: true,
                textFontSize: 10,
              ),
              const Spacer(),
              DotStatus(status: event.eventStatusText,)
            ],
          ),
          item_spacer,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AppImage(url: event.eventImage, width: double.infinity, height: 200,),
          ),
          item_spacer,
          HeadingWidget(
            title: event.eventName,
            fontSize: 14,
          ),
          item_spacer,
          Row(
            children: [
              HeadingWidget(
                title: event.eventType,
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
