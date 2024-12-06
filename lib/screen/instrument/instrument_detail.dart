import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/instrument_service_controller.dart';
import 'package:my_app/model/instrument/instrument_model.dart';
import 'package:my_app/shimmer/instrument_detail_shimmer.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_image.dart';
import 'package:my_app/widget/back_button_widget.dart';

class InstrumentDetail extends StatefulWidget {
  final String instrumentId;

  InstrumentDetail({super.key, required this.instrumentId});

  @override
  State<StatefulWidget> createState() {
    return _InstrumentDetail();
  }
}

class _InstrumentDetail extends State<InstrumentDetail> {
  bool activity = !false;
  String imageUrl = "";
  InstrumentModel? instrumentModel;

  void initState() {
    getInstrument();
  }

  Future<void> getInstrument() async {
    setState(() {
      activity = true;
    });
    final res = await InstrumentServiceController.getInstrumentDetail(
        instrumentId: widget.instrumentId);
    
    
    setState(() {
      activity = false;
      instrumentModel = InstrumentModel(instrument: res.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: activity
          ? InstrumentDetailShimmer()
          : SingleChildScrollView(
              child: Column(
                children: [
                  InstrumentHeader(
                    instrument: instrumentModel!,
                  ),
                ],
              ),
            ),
    );
  }
}

class InstrumentHeader extends StatefulWidget {
  InstrumentModel instrument;

  InstrumentHeader({super.key, required this.instrument});

  @override
  State<StatefulWidget> createState() {
    return _InstrumentHeader();
  }
}

class _InstrumentHeader extends State<InstrumentHeader> {
  int selectedIndex = 0;
  String url = "";
  List<dynamic> list = [];

  void initState() {
    super.initState();
    if (widget.instrument.imageList.isNotEmpty) {
      setState(() {
        url = widget.instrument.imageList.first;
        list = widget.instrument.imageList;
      });
    }
  }

  void onTap(int index) {
    setState(() {
      url = list[index];
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: AppImage(
                  url: url,
                  width: double.infinity,
                  height: 300,
                ),
              ),
              Positioned(
                  top: 0, left: 10, child: SafeArea(child: BackButtonWidget())),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                            color: AppColor.primary),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite),
                            color: AppColor.primary),
                      )
                    ],
                  )),
            ],
          ),
          ImageList(
            list: list,
            onTap: onTap,
            selectedIndex: selectedIndex,
          )
        ],
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  final List<dynamic> list;
  final ValueChanged<int> onTap;
  int selectedIndex;

  ImageList(
      {super.key,
      required this.list,
      required this.onTap,
      this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(10),
          itemBuilder: (_, index) {
            final item = list[index];
            bool isSelected = selectedIndex == index;

            return GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColor.primary, width: isSelected ? 4 : 0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppImage(
                    url: item,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              width: 10,
            );
          },
          itemCount: list.length),
    );
  }
}
