import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/event_service_controller.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/constant/type.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/event_detail_model.dart';
import 'package:my_app/shimmer/event_detail_shimmer.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/app_status_widget.dart';
import 'package:my_app/widget/back_button_widget.dart';
import 'package:my_app/widget/heading_widget.dart';

class EventDetailScreen extends StatefulWidget {
  final String? eventId;

  const EventDetailScreen({super.key, this.eventId});
  @override
  State<StatefulWidget> createState() {
    return _EventDetailScreen();
  }
}

class _EventDetailScreen extends State<EventDetailScreen> {
  bool activity = false;
  dynamic event;

  @override
  void initState() {
    super.initState();
    getEventDetail();
  }

  Future<void> getEventDetail() async {
    if (widget.eventId != null) {
      setState(() {
        activity = true;
      });
      ApiResponse res = await EventServiceController.getEventDetail(
          id: widget.eventId, context: context);
      if (res.status) {
        setState(() {
          activity = false;
          event = res.data;
        });
        return;
      }
      setState(() {
        activity = false;
      });
    }
  }

  Future<void> onRefresh() async {
    getEventDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: activity
          ? const EventDetailShimmer()
          : RefreshIndicator(
              onRefresh: onRefresh,
              child: event != null
                  ? EventDetail(event: EventDetailModel(event: event))
                  : const SizedBox.shrink(),
            ),
    );
  }
}

class EventDetail extends StatelessWidget {
  EventDetailModel event;

  EventDetail({super.key, required this.event});

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EventHeader(
            url: event.eventImage,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: HeadingWidget(title: event.eventName)),
                    AppStatusWidget(
                      status: getEventStatusText(
                          event.eventStatus.toString() ?? ""),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: AppColor.darkGrey,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        HeadingWidget(
                          title: "Nov 12, 10PM  -  Nov 15, 6PM ",
                          isText: true,
                        )
                      ],
                    ),

                    Spacer(),

                    event.ticketPrice_ > 0 ?
                    HeadingWidget(title: Helper.getPrice(event.ticketPrice_), fontSize: 14,)
                    :
                    HeadingWidget(title: "Free", fontSize: 14, color: AppColor.primary,)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColor.darkGrey,
                      size: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    HeadingWidget(
                      title: "The Airstream Main Courtyards, Paintworks.....",
                      isText: true,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                HeadingWidget(
                  title: "Description",
                ),
                const SizedBox(
                  height: 10,
                ),
                HeadingWidget(
                  title: event.eventDescription,
                  isText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 80, // Set a fixed height for the Row
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(height: 8),
                            HeadingWidget(
                              title: "Nov 12 - Nov 15",
                              isText: true,
                            ),
                          ],
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: .5, // Divider thickness
                          width:
                              20, // Space occupied by the divider (including padding)
                          indent: 5, // Space from the top
                          endIndent: 5, // Space from the bottom
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(height: 8),
                            HeadingWidget(
                              title: "People Interested",
                              isText: true,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "5 common friends",
                              style:
                                  TextStyle(color: AppColor.blue, fontSize: 10),
                            )
                          ],
                        ),
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: .5,
                          width: 20,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.event_seat,
                              color: Colors.grey,
                              size: 20,
                            ),
                            const SizedBox(height: 8),
                            HeadingWidget(
                              title: "Tickets Available",
                              isText: true,
                            ),
                            const SizedBox(height: 5),
                            HeadingWidget(
                              title: "5",
                              isText: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.grey.withOpacity(.3), width: 1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingWidget(
                            title: "Invite your friends",
                            fontSize: 16,
                          ),
                          HeadingWidget(
                            title: "and enjoy a shared experience",
                            isText: true,
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Text(
                          "Share",
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                AppButton(title: "Buy ticket", onTap: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EventHeader extends StatelessWidget {
  final String? url;

  EventHeader({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    double containerHeight = 220.0;

    return Container(
      width: double.infinity,
      height: containerHeight,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Image.network(
              url ?? "",
              width: double.infinity,
              height: containerHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
                child: BackButtonWidget(
              bgColor: Colors.black,
              iconColor: Colors.white,
            )),
          ),
          Positioned(
            right: 10,
            top: 20,
            child: SafeArea(
                child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                    color: Colors.white,
                    iconSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark),
                    color: Colors.white,
                    iconSize: 20,
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
