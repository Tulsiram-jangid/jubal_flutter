import 'package:flutter/material.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/AppBarWidget.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:my_app/widget/AppButton.dart';
import 'package:my_app/widget/CustomTextField.dart';

class OtpVerifyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OtpVerifyScreen();
  }
}

class _OtpVerifyScreen extends State<OtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "Verify Otp",
        isHaveBackButton: false,
      ),
      body: Column(children: [
        Container(
          color: AppColor.primary,
          padding: const EdgeInsets.only(left: 15, bottom: 10, right:15), 
          child: const Expanded(child: Text("Enter the code that was sent to your email address/Phone number To finish registering it might take a few minutes to receive your code.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(
                placeholder: "Enter code",
                label: "Enter Code",
                value: "121212",
                textStyle: const TextStyle(
                    letterSpacing: 5,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Did't received?"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Resend code",
                    style: TextStyle(
                        color: AppColor.primary, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              AppButton(title: "Verify", onTap: () {})
            ],
          ),
        ),
      ]),
    );
  }
}
