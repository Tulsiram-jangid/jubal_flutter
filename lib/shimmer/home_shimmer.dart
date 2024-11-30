import 'package:flutter/material.dart';
import 'package:my_app/shimmer/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double postHeight = deviceHeight * .6;

    double deviceWidth =  MediaQuery.of(context).size.width;

    return Container(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ShimmerContainer(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: postHeight,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 10,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 10,
                      color: Colors.grey,
                    ),
                    Spacer(),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: deviceWidth*.8,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: deviceWidth*.7,
                  height: 10,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: deviceWidth*.6,
                  height: 10,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
