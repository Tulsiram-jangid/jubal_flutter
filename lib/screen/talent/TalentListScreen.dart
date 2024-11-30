import 'package:flutter/material.dart';
import 'package:my_app/shimmer/talent_list_shimmer.dart';
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
  bool activity = !false;
  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List.generate(20, (index) => 'Item ${index + 1}');

    return Scaffold(
      appBar: const AppBarWidget(
        title: "Search Talents",
        isHaveBackButton: false,
      ),
      backgroundColor: AppColor.bgColor,
      body: activity ? TalentListShimmer() : Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Search Field
            SearchTextField(
              placeholder: "Search talents...",
            ),
            const SizedBox(
              height: 5,
            ),
            // Expanded GridView
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 130, // Spacing between rows
                ),
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 150, // Add extra bottom padding
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return TalentListWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}