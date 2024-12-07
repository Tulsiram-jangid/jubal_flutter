import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/widget/heading_widget.dart';

class BottomSheetOption extends StatelessWidget {
  List<String> list;

  BottomSheetOption({super.key, this.list = const ["Hello", "Home"]});

  @override
  Widget build(BuildContext context) {
    double itemHeight = 70.0; // Estimated height of each item.
    double maxHeight =
        MediaQuery.of(context).size.height * 0.5; // Set a max height.
    double calculatedHeight = (list.length * itemHeight).clamp(0, maxHeight);

    return Container(
      width: double.infinity,
      height: calculatedHeight,
      child: ListView.builder(
          itemBuilder: (_, index) {
            final item = list[index];
            return OptionItem(
              title: item,
            );
          },
          itemCount: list.length),
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
        padding: const EdgeInsets.all(15),
        child: HeadingWidget(
          title: title,
          fontSize: 16,
        ),
      ),
    );
  }
}
