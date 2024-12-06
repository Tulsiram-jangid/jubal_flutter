import 'package:flutter/material.dart';
import 'package:my_app/shimmer/list_shimmer.dart';
import 'package:my_app/widget/jubal_store_event_widget.dart';

class JubalStoreEvent extends StatelessWidget {
  List<int> list = [1, 1, 1, 1, 1, 1, 1];
  bool activity = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: activity
          ? Expanded(child: ListShimmer())
          : Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return JubalStoreEventWidget();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: list.length)),
    );
  }
}
