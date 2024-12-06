import 'package:flutter/material.dart';
import 'package:my_app/model/post/post_like_model.dart';
import 'package:my_app/widget/app_image.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:my_app/widget/user_circle_image.dart';

class LikedPost extends StatelessWidget {

  final PostLikeModel post;

  LikedPost({
    super.key,
    required this.post
  });

  @override
  Widget build(BuildContext context) {
    double imgHeight = 210;

    return Container(
      height: imgHeight,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AppImage(url: post.postImage, width: double.infinity, height: imgHeight,),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  Colors.black.withOpacity(.0),
                  Colors.black.withOpacity(.1),
                   Colors.black.withOpacity(1)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter,),
              ),
            ),
          ),


          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              
              child: Row(
                children: [
                  UserCircleImage(
                    url: post.userImage,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingWidget(
                        title: post.userFullName,
                        color: Colors.white,
                      ),
                      HeadingWidget(
                        title: post.getCategory,
                        isText: true,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
