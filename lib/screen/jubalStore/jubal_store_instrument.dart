import 'package:flutter/material.dart';
import 'package:my_app/widget/jubal_store_instrument_widget.dart';

class JubalStoreInstrument extends StatelessWidget {
  List<int> list = [1,1,1,1,1,1,1];

  @override
  Widget build(BuildContext context) {
    return Container(child: Expanded(child: ListView.separated(itemBuilder: (context,index){
      return JubalStoreInstrumentWidget();
    }, separatorBuilder: (context,index){
      return const SizedBox(height: 10,);
    }, itemCount: list.length)),);
  }
}