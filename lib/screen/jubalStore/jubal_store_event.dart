import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/event_service_controller.dart';
import 'package:my_app/model/event/event_list_model.dart';
import 'package:my_app/shimmer/list_shimmer.dart';
import 'package:my_app/store/provider/jubal_store_provider.dart';
import 'package:my_app/widget/footer_activity.dart';
import 'package:my_app/widget/jubal_store_event_widget.dart';
import 'package:provider/provider.dart';

class JubalStoreEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JubalStoreEvent();
  }
}

class _JubalStoreEvent extends State<JubalStoreEvent> {
  bool activity = !true;
  bool footerActivity = !true;
  ScrollController scrollController = ScrollController();

  void initState() {
    super.initState();
    getEventList(1);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreEvent();
      }
    });
  }

  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> getEventList(int page) async {
    final eventProvider =
        Provider.of<JubalStoreProvider>(context, listen: false);
    if(eventProvider.eventList.isNotEmpty){
      return;
    }
    
    setState(() {
      activity = true;
    });
    final res = await EventServiceController.getEventList(page: page);
    eventProvider.setEventList(
      list: res.data['event'] ?? [],
      page: page,
      totalPage: res.data['totalPages'] ?? 1,
    );
    setState(() {
      activity = false;
    });
  }

  Future<void> loadMoreEvent() async {
    final eventProvider =
        Provider.of<JubalStoreProvider>(context, listen: false);

    if (eventProvider.eventPage < eventProvider.eventTotalPage) {
      setState(() {
        footerActivity = true;
      });
      int newPage = eventProvider.eventPage + 1;
      final res = await EventServiceController.getEventList(page: newPage);
      final list = eventProvider.eventList;

      eventProvider.setEventList(
        list: [...list, ...res.data['event'] ?? []],
        page: newPage,
      );
      setState(() {
        footerActivity = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider =
        Provider.of<JubalStoreProvider>(context, listen: false);
    final eventList = eventProvider.eventList;

    return Container(
      child: activity
          ? Expanded(child: ListShimmer())
          : Expanded(
              child: ListView.separated(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    if(index == eventList.length-1 && footerActivity){
                      return FooterActivity();
                    }
                    final item = eventList[index];

                    return JubalStoreEventWidget(
                      event: EventListModel(event: item),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: eventList.length),
            ),
    );
  }
}
