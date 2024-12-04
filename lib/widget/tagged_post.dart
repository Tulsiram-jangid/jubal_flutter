import 'package:flutter/material.dart';
import 'package:my_app/widget/heading_widget.dart';

class TaggedPost extends StatelessWidget {
  TextStyle headingStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  TextStyle textStyle = TextStyle(
    color: Colors.grey,
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: "Mohan kumar ",
                style: headingStyle.copyWith(height: 1.8),
                children: [
                  TextSpan(text: "is with ", style: textStyle, children: []),
                  TextSpan(
                      text: "@Sohan kumar ", style: headingStyle, children: []),
                  TextSpan(
                      text:
                          "I have filmed a small vlog of north Dhaka, and I’m very excited to post on YouTube, will po...more ",
                      style: textStyle,
                      children: []),
                  
                ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("2 hr", style: textStyle.copyWith(fontWeight: FontWeight.w600),),
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2017/12/08/11/53/event-party-3005668_640.jpg",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
