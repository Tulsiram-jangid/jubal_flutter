import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/instrument_service_controller.dart';
import 'package:my_app/model/instrument_model.dart';
import 'package:my_app/shimmer/list_shimmer.dart';
import 'package:my_app/store/provider/jubal_store_provider.dart';
import 'package:my_app/widget/footer_activity.dart';
import 'package:my_app/widget/jubal_store_instrument_widget.dart';
import 'package:provider/provider.dart';

class JubalStoreInstrument extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JubalStoreInstrument();
  }
}

class _JubalStoreInstrument extends State<JubalStoreInstrument> {
  List<int> list = [1];
  bool activity = false;
  bool footerActivity = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getInstrument();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreInstrument();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> getInstrument() async {
    final instrumentProvider =
        Provider.of<JubalStoreProvider>(context, listen: false);
    if(instrumentProvider.instrumentList.isNotEmpty){
      return;
    }

    setState(() {
      activity = true;
    });
    final res =
        await InstrumentServiceController.getJubalStoreInstrumentList(page: 1);

    instrumentProvider.setInstrumentList(
      list: res.data['instrument'],
      page: 1,
      totalPage: res.data['totalPages'],
    );

    setState(() {
      activity = false;
    });
  }

  Future<void> loadMoreInstrument() async {
    final instrumentProvider =
        Provider.of<JubalStoreProvider>(context, listen: false);
    if(instrumentProvider.instrumentPage < instrumentProvider.instrumentTotalPage){
      int newPage = instrumentProvider.instrumentPage + 1;
      List<dynamic> _list = instrumentProvider.instrumentList;
      setState(() {
        footerActivity = true;
      });
      final res =
        await InstrumentServiceController.getJubalStoreInstrumentList(page: newPage);
      instrumentProvider.setInstrumentList(
        list: [..._list,...res.data['instrument'] ?? []],
        page: newPage
      );
      setState(() {
        footerActivity = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final instrumentProvider = Provider.of<JubalStoreProvider>(context);
    final instrumentList = instrumentProvider.instrumentList;
    
    return Container(
      child: activity
          ? Expanded(
              child: ListShimmer(
              height: 100,
            ))
          : Expanded(
              child: ListView.separated(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    final item = instrumentList[index];
                    if(index == instrumentList.length -1 && footerActivity){
                      return FooterActivity();
                    }
                    return JubalStoreInstrumentWidget(instrumentModel: InstrumentModel(instrument: item),);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: instrumentList.length),
            ),
    );
  }
}
