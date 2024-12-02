import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/api/ApiController/event_service_controller.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/model/event_list_model.dart';
import 'package:my_app/shimmer/event_list_shimmer.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/event_list_widget.dart';
import 'package:my_app/widget/footer_activity.dart';
import 'package:my_app/widget/search_text_widget.dart';

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
    scrollController.addListener((){
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        
      }
    });
  }

  @override
  void dispose(){
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
          children: [
            const SearchTextField(
              placeholder: "Search events...",
            ),
            const SizedBox(
              height: 10,
            ),
            if (activity)
              Expanded(child: EventListShimmer())
            else
              Expanded(
                child: ListView.separated(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    if(index == list.length-1 && footerActivity){
                      return FooterActivity();
                    }
                    final item = list[index];
                    return EventListWidget(event: EventListModel(event: item),);
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
