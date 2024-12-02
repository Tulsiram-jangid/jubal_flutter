import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/app_button.dart';

class UploadImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UploadImage();
  }
}

class _UploadImage extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    double imgSize = MediaQuery.of(context).size.width * .5;

    return Scaffold(
      appBar: const AppBarWidget(
        title: "Adding a picture helps peoples recognise you",
        isHaveBackButton: false,
      ),
      body: Column(
        children: [
          Container(
            color: AppColor.primary,
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: const Text(
              "Based on your level of performance people can know more about you and your profession",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(50),
                      width: imgSize,
                      height: imgSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/image_placeholder.svg',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AppButton(title: "Add Photo", onTap: () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("It will help others know you add your photo"),
            
                    const Spacer(),
                    AppButton(title: "Continue", onTap: () {}),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
