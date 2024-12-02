import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/talent_service_controller.dart';
import 'package:my_app/model/staticData/talent_list_model.dart';
import 'package:my_app/shimmer/talent_list_shimmer.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/search_text_widget.dart';
import 'package:my_app/widget/talent_list_widget.dart';
import 'package:my_app/widget/footer_activity.dart';
import 'package:provider/provider.dart';

class TalentListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TalentListScreen();
  }
}

class _TalentListScreen extends State<TalentListScreen> {
  bool activity = false;
  bool footerActivity = false;
  List<dynamic> list = [];
  int page = 1;
  int totalPage = 1;
  int totalItems = 0;

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getTalents(1);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMoreTalent();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> getTalents(int page) async {
    setState(() {
      activity = true;
    });
    final res = await TalentServiceController.getTalentList(
        context: context, page: page);
    if (res.status) {
      setState(() {
        list = res.data['data'];
        totalPage = res.data['totalPages'];
        totalItems = res.data['totalItems'];
        page = page;
        activity = false;
      });
      return;
    }
    setState(() {
      activity = false;
    });
  }

  Future<void> loadMoreTalent() async {
    if (page < totalPage) {
      setState(() {
        footerActivity = true;
      });
      int newPage = page + 1;
      final res = await TalentServiceController.getTalentList(
          context: context, page: newPage);
      if (res.status) {
        setState(() {
          footerActivity = false;
          list.addAll(res.data['data']);
          page = newPage;
        });
        return;
      }
      setState(() {
        footerActivity = false;
      });
    }
  }

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
      body: activity
          ? TalentListShimmer()
          : Padding(
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
                    flex: 1,
                    child: GridView.builder(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of columns
                              crossAxisSpacing: 10, // Spacing between columns
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.56 // Spacing between rows
                              ),
                      padding: const EdgeInsets.only(
                        top: 10,
                        //bottom: 150, // Add extra bottom padding
                      ),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final item = list[index];

                        if(index == list.length - 1 && footerActivity){
                          return FooterActivity();
                        }
                        return TalentListWidget(
                            talent: TalentListModel(talent: item));
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
