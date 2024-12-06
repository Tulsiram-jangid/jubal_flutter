import 'package:flutter/material.dart';
import 'package:my_app/shimmer/list_shimmer.dart';
import 'package:my_app/widget/jubal_store_instrument_widget.dart';

class JubalStoreInstrument extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JubalStoreInstrument();
  }
}

class _JubalStoreInstrument extends State<JubalStoreInstrument> {
  List<int> list = [1, 1, 1, 1, 1, 1, 1];
  bool activity = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: activity
          ? Expanded(child: ListShimmer(height: 100,))
          : Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return JubalStoreInstrumentWidget();
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
