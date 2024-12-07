import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/api/ApiController/instrument_service_controller.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/instrument/instrument_model.dart';
import 'package:my_app/shimmer/instrument_detail_shimmer.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/app_image.dart';
import 'package:my_app/widget/back_button_widget.dart';
import 'package:my_app/widget/heading_widget.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InstrumentHeader(
                    instrument: instrumentModel!,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: InstrumentBody(instrument: instrumentModel!),
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
    final instrument = widget.instrument;
    double _height = MediaQuery.of(context).size.height;

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
                  height: _height*.4,
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
                            icon: instrument.isSavedByMe ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border, color: AppColor.darkGrey,),
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
                            icon: instrument.isSavedByMe ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_border, color: AppColor.darkGrey,),
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

class InstrumentBody extends StatelessWidget {
  InstrumentModel instrument;

  InstrumentBody({super.key, required this.instrument});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HeadingWidget(title: instrument.instrumentName),
              Spacer(),
              HeadingWidget(title: Helper.getPrice(99)),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          HeadingWidget(
            title: "Brand : ${instrument.brand}",
            isText: true,
            textFontSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: AppColor.darkGrey,
              ),
              HeadingWidget(
                title: "670 main durbon northdeen south africa",
                isText: true,
                textFontSize: 14,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          HeadingWidget(
            title: "Overview",
          ),
          HeadingWidget(
            title: instrument.about,
            isText: true,
            textFontSize: 14,
          ),
          const SizedBox(
            height: 20,
          ),
          HeadingWithPoints(
            title: "Feature",
            list: instrument.features,
          ),
          const SizedBox(
            height: 20,
          ),
          HeadingWithPoints(
            title: "Specifications",
            list: instrument.specification,
          ),
         
          const SizedBox(
            height: 20,
          ),
          HeadingWidget(
            title: "Condition",
          ),
          HeadingWidget(
            title: instrument.condition,
            isText: true,
            textFontSize: 14,
          ),
          SafeArea(
            child: AppButton(
              title: "Add to cart",
              onTap: () {},
              leftIcon: SvgPicture.asset(
                "assets/icons/cart.svg",
                width: 20,
                height: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeadingWithPoints extends StatelessWidget {
  final String title;
  final List<dynamic> list;

  HeadingWithPoints({super.key, required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingWidget(
            title: title,
          ),
          ...list.map((item) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(width: 6,),
                  HeadingWidget(
                    title: item,
                    isText: true,
                    textFontSize: 14,
                  ),
                ],
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
