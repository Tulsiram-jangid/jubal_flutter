import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyProfileShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = List.generate(10, (index) => index);

    return Container(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade400,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CircleAvatar(
                radius: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 100,
                height: 20,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 100,
                    height: 30,
                    color: Colors.grey,
                  )
                ],
              ),
              Expanded(
                flex: 1,
                child: ListView.separated(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.grey,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10,);
                    },
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
