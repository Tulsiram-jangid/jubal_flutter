import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/AppBarWidget.dart';
import 'package:my_app/widget/SeachTextField.dart';
import 'package:my_app/widget/TalentListWidget.dart';

class TalentListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TalentListScreen();
  }
}

class _TalentListScreen extends State<TalentListScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List.generate(20, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: AppBarWidget(
        title: "Search Talents",
        isHaveBackButton: false,
      ),
      backgroundColor: AppColor.bgColor,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SearchTextField(
              placeholder: "Search talents...",
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                ),
                padding: EdgeInsets.all(10),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return TalentListWidget();
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
