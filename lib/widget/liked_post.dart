import 'package:flutter/material.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:my_app/widget/user_circle_image.dart';

class LikedPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imgHeight = 210;

    String URL =
        "https://cdn.pixabay.com/photo/2017/12/08/11/53/event-party-3005668_640.jpg";

    return Container(
      height: imgHeight,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              URL,
              height: imgHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
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
                  UserCircleImage(),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingWidget(
                        title: "Sound of reviewval",
                        color: Colors.white,
                      ),
                      HeadingWidget(
                        title: "Sound of reviewval",
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
