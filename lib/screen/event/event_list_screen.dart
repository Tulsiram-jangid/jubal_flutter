import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/api/ApiController/event_service_controller.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/model/event/event_list_model.dart';
import 'package:my_app/shimmer/event_list_shimmer.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/event_list_widget.dart';
import 'package:my_app/widget/footer_activity.dart';
import 'package:my_app/widget/search_text_widget.dart';
import 'package:my_app/widget/total_result_widget.dart';

class EventListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventListScreen();
  }
}

class _EventListScreen extends State<EventListScreen> {
  bool activity = false;
  bool footerActivity = false;
  bool searchActivity = false;
  List<dynamic> list = [];
  int page = 1;
  int totalPage = 1;
  int totalItems = 0;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getEvents(1);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreEvent();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> getEvents(int page) async {
    setState(() {
      activity = true;
    });
    ApiResponse res = await EventServiceController.getEventList(
      context: context,
      page: page,
    );
    if (res.status) {
      List<dynamic> _list = List<dynamic>.from(res.data['event'] ?? []);
      setState(() {
        activity = false;
        list = _list;
        page = page;
        totalItems = res.data['count'] ?? 0;
        totalPage = res.data['totalPages'] ?? 1;
      });
      return;
    }
    setState(() {
      activity = false;
    });
  }

  Future<void> loadMoreEvent() async {
    if (page < totalPage) {
      int newPage = page + 1;
      setState(() {
        footerActivity = true;
      });
      ApiResponse res = await EventServiceController.getEventList(
        context: context,
        page: newPage,
      );
      if (res.status) {
        List<dynamic> _list = List<dynamic>.from(res.data['event'] ?? []);
        setState(() {
          footerActivity = false;
          list.addAll(_list);
          page = newPage;
        });
      }
      setState(() {
        footerActivity = false;
      });
    }
  }

  Future<void> onSearchEvent(String value) async {
    if (value.isEmpty) {
      getEvents(1);
      return;
    }
    setState(() {
      searchActivity = true;
    });
    ApiResponse res = await EventServiceController.getEventList(
        context: context, page: 1, eventName: value);
    if (res.status) {
      List<dynamic> _list = List<dynamic>.from(res.data['event'] ?? []);
      setState(() {
        searchActivity = false;
        list = _list;
        page = 1;
        totalItems = res.data['count'] ?? 0;
        totalPage = res.data['totalPages'] ?? 1;
      });
    }
    setState(() {
      searchActivity = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'items ${index}');

    return Scaffold(
      appBar: const AppBarWidget(
        title: "Jubal Events",
        isHaveBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextField(
              placeholder: "Search events...",
              activity: searchActivity,
              onChanged: onSearchEvent,
            ),
            const SizedBox(
              height: 10,
            ),
            TotalResultWidget(totalItem: totalItems.toString()),
            const SizedBox(
              height: 10,
            ),
            if (activity)
              Expanded(child: EventListShimmer())
            else
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: list.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == list.length - 1 && footerActivity) {
                      return FooterActivity();
                    }
                    final item = list[index];
                    return EventListWidget(
                      event: EventListModel(event: item),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
