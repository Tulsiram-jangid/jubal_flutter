import 'package:flutter/material.dart';
import 'package:my_app/widget/instrument_widget.dart';
import 'package:my_app/widget/liked_post.dart';

class MyLikedInstrument extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyLikedInstrument();
  }
}

class _MyLikedInstrument extends State<MyLikedInstrument> {
  List<int> list = [1, 2, 3, 4,5,6,7,8,9];

  Future<void> onRefresh()async {}

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: RefreshIndicator(
        onRefresh: onRefresh,
        
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InstrumentWidget();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: list.length),
        ),
      ),
    );
  }
}
