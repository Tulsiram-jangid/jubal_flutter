import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/api/ApiController/talent_service_controller.dart';
import 'package:my_app/api/request.dart';
import 'package:my_app/model/talent/talent_detail_model.dart';
import 'package:my_app/shimmer/my_profile_shimmer.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:my_app/widget/profile_header_widget.dart';

class TalentDetail extends StatefulWidget {
  final String talentId;

  const TalentDetail({super.key, required this.talentId});

  @override
  State<StatefulWidget> createState() {
    return _TalentDetail();
  }
}

class _TalentDetail extends State<TalentDetail> {
  TalentDetailModel? talent;
  bool activity = false;

  String url =
      "https://storage.googleapis.com/support-kms-prod/Ch5HG5RGzGnfHhvVSD93gdoEvWm5IPGUkOnS";

  void initState() {
    super.initState();
    getTalentDetail();
  }

  void getTalentDetail() async {
    setState(() {
      activity = true; // Set activity indicator to true
    });

    try {
      // Fetch user details
      final res =
          await TalentServiceController.getUserDetail(userId: widget.talentId);
      if (res.data != null) {
        TalentDetailModel detail = TalentDetailModel(talent: res.data);
        setState(() {
          activity = false; // Stop activity indicator
          talent = detail;
        });
      } else {
        // Handle the case where no data is returned
        setState(() {
          activity = false;
        });
      }
    } catch (e) {
      // Handle any errors that occur during the fetch
      setState(() {
        activity = false; // Stop activity indicator
      });
      debugPrint('Error fetching talent details: $e');
    }
  }

  Widget get itemSpacer {
    return const SizedBox(
      height: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    String profileBanner = talent != null ? talent!.profileBanner : "";
    String profilePhoto = talent != null ? talent!.profilePhoto : "";

    return Scaffold(
      appBar: null,
      body: activity
          ? MyProfileShimmer()
          : Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileHeaderWidget(
                          profileBanner: profileBanner,
                          profilePhoto: profilePhoto),
                      HeadingWidget(title: talent!.fullName),
                      HeadingWidget(
                        title: talent!.category,
                        isText: true,
                      ),
                      itemSpacer,
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppButton(
                              title: "Follow",
                              onTap: () {},
                              backgroundColor: Colors.black,
                              height: 40,
                            ),
                            itemSpacer,
                            HeadingWidget(
                              title: "About Justin Bieber",
                              fontSize: 16,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            HeadingWidget(
                              title: talent!.about,
                              isText: true,
                            ),
                            if (talent!.instrumentList.isNotEmpty) ...[
                              itemSpacer,
                              HeadingWidget(
                                title: "Primary Instrument",
                                fontSize: 16,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ItemList(
                                list: talent!.instrumentList,
                              ),
                            ],
                            if (talent!.genreList.isNotEmpty) ...[
                              itemSpacer,
                              HeadingWidget(
                                title: "Genre",
                                fontSize: 16,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ItemList(
                                list: talent!.genreList,
                              ),
                            ]
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Footer(
                  talent: talent!,
                )
              ],
            ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<String> list;

  const ItemList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Ensure the ListView has a fixed height.
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final item = list[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade600,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5)),
            child: HeadingWidget(
              title: item,
              fontSize: 12,
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemCount: list.length,
      ),
    );
  }
}

class Footer extends StatelessWidget {
  TalentDetailModel talent;
  Footer({super.key, required this.talent});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                  child: AppButton(
                title: "Hire Jubal Talent",
                onTap: () {},
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: AppButton(
                title: "Chat",
                onTap: () {},
                backgroundColor: Colors.white,
                textColor: Colors.grey,
                borderColor: Colors.grey.shade300,
                leftIcon: SvgPicture.asset("assets/icons/chat1.svg", width: 20,height: 20,),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
