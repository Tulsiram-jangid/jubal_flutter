import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/api/ApiController/file_service_controller.dart';
import 'package:my_app/constant/app_constant.dart';
import 'package:my_app/helper/picker.dart';
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

  File? bannerFile;
  File? imageFile;
  String? bannerUrl =
      "https://plus.unsplash.com/premium_photo-1701590725747-ac131d4dcffd?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8d2Vic2l0ZSUyMGJhbm5lcnxlbnwwfHwwfHx8MA%3D%3D";
  String? imageUrl;

  bool activity = false;

  void initState() {
    super.initState();
    getUser();
  }

  void getUser() {
    final storeProvider = Provider.of<StoreProvider>(context, listen: false);
    final user = storeProvider.user;
    if (user != null) {
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

  void onSubmit() async {
    final List<Future> uploadTask = [];
    setState(() {
      activity = true;
    });
    if (imageFile != null) {
      uploadTask.add(FileServiceController.uploadFile(
          file: imageFile!,
          userId: AppConstant.userId ?? "",
          type: "profilePhoto",
          key: "profilePhoto"));
    }
    if (bannerFile != null) {
      uploadTask.add(FileServiceController.uploadFile(
          file: bannerFile!,
          userId: AppConstant.userId ?? "",
          type: "profileBanner",
          key: "profileBanner"));
    }
    if(uploadTask.isNotEmpty){
      final res = await Future.wait(uploadTask);
    }
    setState(() {
      activity = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "Personal Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ProfileHeader(
                imageFile: imageFile,
                bannerFile: bannerFile,
                bannerUrl: bannerUrl,
                imageUrl: imageUrl,
                onTapBanner: () {
                  Picker.openGallery((path) {
                    setState(() {
                      bannerFile = File(path);
                    });
                  });
                },
                onTapImage: () {
                  Picker.openGallery((path) {
                    setState(() {
                      imageFile = File(path);
                    });
                  });
                },
              ),
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
                child: AppButton(
                  title: "Save",
                  onTap: onSubmit,
                  disabled: !true,
                  isLoading: activity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final VoidCallback onTapImage;
  final VoidCallback onTapBanner;
  final File? imageFile;
  final File? bannerFile;
  final String? imageUrl;
  final String? bannerUrl;

  final double bannerHeight = 150;

  const ProfileHeader(
      {super.key,
      required this.onTapBanner,
      required this.onTapImage,
      this.imageFile,
      this.bannerFile,
      this.imageUrl,
      this.bannerUrl});

  Widget get editButton {
    return Container(
      child: Center(
          child: SizedBox(
        child: IconButton(
          onPressed: onTapImage,
          icon: const Icon(Icons.edit),
          color: AppColor.darkGrey,
        ),
      )),
    );
  }

  Widget get editBannerButton {
    return Container(
      child: Center(
          child: SizedBox(
        child: IconButton(
          onPressed: onTapBanner,
          icon: const Icon(Icons.edit),
          color: AppColor.darkGrey,
        ),
      )),
    );
  }

  Widget get renderBanner {
    if (bannerFile != null) {
      return Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                bannerFile!,
                width: double.infinity,
                height: bannerHeight,
                fit: BoxFit.cover,
              )),
          Positioned(right: 0, bottom: 0, child: editBannerButton)
        ],
      );
    }
    if (bannerUrl != null && bannerUrl!.isNotEmpty) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AppImage(
              url: bannerUrl!,
              width: double.infinity,
              height: bannerHeight,
            ),
          ),
          Positioned(right: 0, bottom: 0, child: editBannerButton)
        ],
      );
    }
    return (Column(
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
        InkWell(
          onTap: onTapBanner,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: const Text(
              "Upload banner",
              style: TextStyle(fontSize: 10, color: AppColor.darkGrey),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
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
                child: renderBanner,
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
              child: imageFile != null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: FileImage(imageFile!),
                    )
                  : UserCircleImage(
                      url: "",
                      radius: 50,
                    ),
            ),
          ),
          Positioned(bottom: 0, right: 0, left: 70, child: editButton)
        ],
      ),
    );
  }
}
