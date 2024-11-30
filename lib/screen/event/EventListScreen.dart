import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/shimmer/event_list_shimmer.dart';
import 'package:my_app/widget/AppBarWidget.dart';
import 'package:my_app/widget/EventListWidget.dart';
import 'package:my_app/widget/SeachTextField.dart';

class EventListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventListScreen();
  }
}

class _EventListScreen extends State<EventListScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'items ${index}');

    return Scaffold(
      appBar: AppBarWidget(
        title: "Jubal Events",
        isHaveBackButton: false,
      ),
      body: true ? EventListShimmer() : Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SearchTextField(
              placeholder: "Search events...",
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return EventListWidget();
                  },
                  separatorBuilder: (context,index){
                    return const SizedBox(height: 10,);
                  },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
