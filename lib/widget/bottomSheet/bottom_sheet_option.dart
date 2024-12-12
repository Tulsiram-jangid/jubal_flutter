import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/model/staticData/bottom_sheet_option_model.dart';
import 'package:my_app/widget/heading_widget.dart';

class BottomSheetOption extends StatelessWidget {
  final List<BottomSheetOptionModel> list;
  final ValueChanged<BottomSheetOptionModel> onPressed;

  BottomSheetOption({super.key, required this.list, required this.onPressed});

  void onClose (BuildContext context){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double itemHeight = 80.0; // Estimated height of each item.
    double maxHeight =
        MediaQuery.of(context).size.height * 0.5; // Set a max height.
    double calculatedHeight = itemHeight * list.length + itemHeight;

    return Container(
      width: double.infinity,
      height: calculatedHeight,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (_, index) {
                  final item = list[index];
                  return OptionItem(
                    title: item.title,
                    onPressed: () {
                      onPressed(item);
                    },
                  );
                },
                itemCount: list.length),
          ),
          Divider(),
          SafeArea(child: OptionItem(
            title: "Close",
            onPressed: (){
              onClose(context);
            },
          ))
        ],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  OptionItem({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.all(15),
        child: HeadingWidget(
          title: title,
          fontSize: 16,
        ),
      ),
    );
  }
}
