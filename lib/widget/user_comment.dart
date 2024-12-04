import 'package:flutter/material.dart';
import 'package:my_app/widget/heading_widget.dart';
import 'package:my_app/widget/user_badge_widget.dart';
import 'package:my_app/widget/user_circle_image.dart';

class UserComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double imgSize = 70;

    return SizedBox(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserCircleImage(
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                HeadingWidget(
                                  title: "Mohan kumar",
                                  fontSize: 14,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                UserBadgeWidget()
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            HeadingWidget(
                              title:
                                  "Etiam ultricies ligula lorem vulputate velit hendrerit, libero",
                              isText: true,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            HeadingWidget(
                              title: "2 weeks",
                              isText: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2017/12/08/11/53/event-party-3005668_640.jpg",
                          width: imgSize,
                          height: imgSize,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SubComment()
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class SubComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserCircleImage(
              color: Colors.grey,
              radius: 12,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      HeadingWidget(
                        title: "Mohan kumar",
                        fontSize: 14,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      UserBadgeWidget()
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  HeadingWidget(
                    title:
                        "Etiam ultricies ligula lorem vulputate velit hendrerit, libero",
                    isText: true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  HeadingWidget(
                    title: "2 weeks",
                    isText: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
