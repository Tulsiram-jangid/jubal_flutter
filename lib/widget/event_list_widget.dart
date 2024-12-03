import 'package:flutter/material.dart';
import 'package:my_app/constant/app_navigation.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/event_list_model.dart';
import 'package:my_app/route/route_name.dart';
import 'package:my_app/utils/appColor.dart';

class EventListWidget extends StatelessWidget {
  final EventListModel event;

  const EventListWidget({super.key, required this.event});


  void onTap(BuildContext context){
    if(event.id != null){
      AppNavigation.navigateToEventDetail(context: context, eventId: event.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    const imgHeight = 200.0;

    return GestureDetector(
      onTap: (){onTap(context);},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  event.eventImage,
                  width: double.infinity,
                  height: imgHeight,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text(
                          event.eventName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                        if (event.ticketPrice_ == 0)
                          const Text(
                            "Free",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary),
                          )
                        else
                          Text(
                            Helper.getPrice(event.ticketPrice_),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      event.eventType,
                      style: const TextStyle(color: AppColor.darkGrey),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColor.darkGrey,
                        ),
                        Expanded(
                            child: Text(
                          event.location,
                          style: const TextStyle(color: AppColor.darkGrey),
                          maxLines: 2,
                        )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
