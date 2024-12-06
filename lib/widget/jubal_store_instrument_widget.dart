import 'package:flutter/material.dart';
import 'package:my_app/helper/helper.dart';
import 'package:my_app/widget/heading_widget.dart';

class JubalStoreInstrumentWidget extends StatelessWidget {
  final String URL =
      "https://media.istockphoto.com/id/894058154/photo/musical-instruments.jpg?s=612x612&w=0&k=20&c=uB0TFyqeY1wu1BPyH2EB7NMoOCaSb86pk7YNQ5QVCGQ=";

  JubalStoreInstrumentWidget({
    super.key,
  });

  Widget get item_spacer {
    return const SizedBox(height: 8,);
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
            child:Image.network(
              URL,
              width: imgSize,
              height: imgSize,
              fit: BoxFit.cover,
            ),
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
                    HeadingWidget(title: "Gitar"),
                    const Spacer(),
                    HeadingWidget(title: Helper.getPrice(99)),
                  ],
                ),
                item_spacer,
                HeadingWidget(title: "Gitar", isText: true,),
                item_spacer,
                HeadingWidget(title: "Gitar", isText: true,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
