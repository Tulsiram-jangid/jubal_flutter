import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/store/provider/StoreProvider.dart';
import 'package:my_app/utils/appColor.dart';
import 'package:my_app/widget/app_bar_widget.dart';
import 'package:my_app/widget/app_button.dart';
import 'package:my_app/widget/app_image.dart';
import 'package:my_app/widget/custome_text_field.dart';
import 'package:my_app/widget/user_circle_image.dart';
import 'package:provider/provider.dart';

class ProfileDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileDetail();
  }
}

class _ProfileDetail extends State<ProfileDetail> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController countryCode =
      TextEditingController(text: AppConstant.defaultCountryCode);
  TextEditingController email = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController location = TextEditingController();


  void initState(){
    super.initState();
    getUser();
  }

  void getUser(){
    final storeProvider = Provider.of<StoreProvider>(context, listen: false);
    final user = storeProvider.user;
    if(user != null){
      Map<String, dynamic> locationData = jsonDecode(user.location ?? "");

      firstName.text = user.firstName ?? "";
      lastName.text = user.lastName ?? "";
      userName.text = user.username ?? "";
      mobile.text = user.phone.toString();
      countryCode.text = user.countryCode ?? "";
      email.text = user.email ?? "";
      location.text = locationData['address'] ?? "";
      about.text = user.about ?? "";
    }
  }

  Widget get item_spacer {
    return const SizedBox(
      height: 20,
    );
  }

  void onSubmit() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Personal Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ProfileHeader(),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                textEditingController: firstName,
                placeholder: "Enter first name",
                label: "First name",
              ),
              item_spacer,
              CustomTextField(
                textEditingController: lastName,
                placeholder: "Enter last name",
                label: "Last name",
              ),
              item_spacer,
              CustomTextField(
                textEditingController: userName,
                placeholder: "Enter user name",
                label: "Username",
              ),
              item_spacer,
              CustomTextField(
                textEditingController: mobile,
                placeholder: "Enter phone number",
                label: "Phone",
                isMobileNumber: true,
                countryCode: countryCode.text,
              ),
              item_spacer,
              CustomTextField(
                textEditingController: email,
                placeholder: "Enter email address",
                label: "Email",
              ),
              item_spacer,
              CustomTextField(
                textEditingController: location,
                placeholder: "Select location",
                label: "Location",
                isDropDown: true,
              ),
              item_spacer,
              CustomTextField(
                textEditingController: about,
                placeholder: "Enter about you",
                label: "About yourself",
                maxLines: 5,
                maxLength: 500,
              ),
              const SizedBox(
                height: 100,
              ),
              SafeArea(
                child: AppButton(title: "Save", onTap: onSubmit, disabled: !true,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bannerHeight = 150;

    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: bannerHeight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade300),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      "assets/images/placeholder.png",
                      width: 35,
                      height: 35,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "Upload banner",
                          style:
                              TextStyle(fontSize: 10, color: AppColor.darkGrey),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
              ),
              // AppImage(url: "", width: double.infinity, height: 150,),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: UserCircleImage(
                url: "",
                radius: 50,
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 70,
              child: Container(
                child: Center(
                    child: SizedBox(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    color: AppColor.darkGrey,
                  ),
                )),
              ))
        ],
      ),
    );
  }
}
