import 'package:flutter/material.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/model/instrument_model.dart';
import 'package:my_app/widget/app_image.dart';
import 'package:my_app/widget/heading_widget.dart';

class JubalStoreInstrumentWidget extends StatelessWidget {
  final String URL =
      "https://media.istockphoto.com/id/894058154/photo/musical-instruments.jpg?s=612x612&w=0&k=20&c=uB0TFyqeY1wu1BPyH2EB7NMoOCaSb86pk7YNQ5QVCGQ=";

  final InstrumentModel instrumentModel;

  JubalStoreInstrumentWidget({super.key, required this.instrumentModel});

  Widget get item_spacer {
    return const SizedBox(
      height: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    double imgSize = 90;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AppImage(url: instrumentModel.instrumentImage, width: imgSize, height: imgSize,),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 10,
                        child: HeadingWidget(
                          title: instrumentModel.instrumentName,
                          maxLines: 1,
                        )),
                    const Spacer(),
                    HeadingWidget(
                        title: Helper.getPrice(instrumentModel.sellingPrice)),
                  ],
                ),
                item_spacer,
                HeadingWidget(
                  title: instrumentModel.primaryCategory,
                  isText: true,
                ),
                item_spacer,
                HeadingWidget(
                  title: instrumentModel.brand,
                  isText: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
