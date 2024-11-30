import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/model/PostModel.dart';
import 'package:my_app/utils/appColor.dart';

class HomePostWidget extends StatelessWidget {
  final url =
      "https://media.gettyimages.com/id/622987928/photo/music-concert.jpg?s=612x612&w=gi&k=20&c=5-KouutHsY5tDliefHHCrV0q_VecZgmalXvp8MWRtR0=";

  final dynamic post;

  const HomePostWidget({super.key, required this.post});

  String getFullName() {
    String name = "";
    if (post['User']['firstName'] != null) {
      name = post['User']['firstName'];
    }
    if (post['User']['lastName'] != null) {
      name = "${name} ${post['User']['lastName']}";
    }
    return name;
  }

  String getDes() {
    String des = "";
    if (post['User']['Talent']['catagory'] != null) {
      List<String> result =
          List<String>.from(jsonDecode(post['User']['Talent']['catagory']));
      des = result.isNotEmpty ? result.first : "";
    }
    return des;
  }

  String getUserImage() {
    String url = "";
    if (post['User']['profilePhoto'] != null) {
      return post['User']['profilePhoto'];
    }
    return url;
  }

  String getTotalLike() {
    String totalLike = "0";
    if (post['Likes'] != null) {
      totalLike = "${post['Likes']} likes";
    }
    return totalLike;
  }

  String getTotalComment() {
    String comments = "0";
    if (post['Comments'] != null) {
      comments = "${post['Comments']} comments";
    }
    return comments;
  }

  String getPostDescription() {
    if (post['caption'] != null) {
      return post['caption'];
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double postHeight = deviceHeight * .5;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: postHeight,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: post != null && post['postImageUrl'] != null
                      ? Image.network(
                          post['postImageUrl'],
                          fit: BoxFit.contain,
                        )
                      : null,
                ),
              ),
              Container(
                width: double.infinity,
                height: postHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(
                          1), // Dark overlay at the top // Transparent overlay at the bottom
                    ],
                    stops: [0, 1.0],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: postHeight,
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(getUserImage()),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getFullName(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  getDes(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: Row(
              children: [
                Text(getTotalLike()),
                const SizedBox(
                  width: 10,
                ),
                Text(getTotalComment()),
                Spacer(),
                Icon(
                  Icons.favorite_border,
                  color: AppColor.darkGrey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.chat,
                  color: AppColor.darkGrey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.bookmark_border,
                  color: AppColor.darkGrey,
                )
              ],
            ),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: getFullName(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: getPostDescription(),
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800], // Optional: Adjust text color
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
