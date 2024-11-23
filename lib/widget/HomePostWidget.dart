import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/utils/appColor.dart';

class HomePostWidget extends StatelessWidget {
  final url =
      "https://media.gettyimages.com/id/622987928/photo/music-concert.jpg?s=612x612&w=gi&k=20&c=5-KouutHsY5tDliefHHCrV0q_VecZgmalXvp8MWRtR0=";

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double postHeight = deviceHeight * .6;
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: postHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://media.gettyimages.com/id/622987928/photo/music-concert.jpg?s=612x612&w=gi&k=20&c=5-KouutHsY5tDliefHHCrV0q_VecZgmalXvp8MWRtR0=",
                    fit: BoxFit.cover,
                  ),
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
                              backgroundImage: NetworkImage(url),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sound of reveal",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Sound of reveal",
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
                Text("5 likes"),
                const SizedBox(
                  width: 10,
                ),
                Text("5 comments"),
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
              text: "Sound of revival ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text:
                  "I have filmed a small vlog of north Dhaka, and I’m very excited to post on YouTube, will po...more 🤭",
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
